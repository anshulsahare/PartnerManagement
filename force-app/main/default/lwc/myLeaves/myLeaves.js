import { LightningElement,wire,track,api } from 'lwc';
import getMyLeave from '@salesforce/apex/LeaveController.getMyLeave'; 
import { ShowToastEvent } from 'lightning/platformShowToastEvent';  
import FROM_DATE from '@salesforce/schema/LeaveRequest__c.From_Date__c';
import TO_DATE from '@salesforce/schema/LeaveRequest__c.To_Date__c';
import REASON from '@salesforce/schema/LeaveRequest__c.Reason__c';
import USER from '@salesforce/schema/LeaveRequest__c.User__c';
import STATUS from '@salesforce/schema/LeaveRequest__c.Status__c';
import Id from '@salesforce/user/Id';
import {refreshApex} from '@salesforce/apex';

const columns = [
  //cellAttribtes is class under it we we create class also
  { label: 'Request ID', fieldName:  'Name', cellAttributes:{class:{fieldName:'cellClass'}}},
  { label: 'From Data', fieldName:  'From_Date__c', cellAttributes:{class:{fieldName:'cellClass'}} },
  { label: 'To Date', fieldName: 'To_Date__c' , cellAttributes:{class:{fieldName:'cellClass'}}},
  { label: 'Reason', fieldName: 'Reason__c', cellAttributes:{class:{fieldName:'cellClass'}}},
  { label: 'Status', fieldName: 'Status__c', cellAttributes:{class:{fieldName:'cellClass'}}},


  {
      type:"button",
      fixedWidth: 150,
      typeAttributes: {
          label: 'Edit',
          name: 'edit',
          variant: 'brand',
        // disabled:{'fieldname' : 'isEditDisable'}
      },
     cellAttributes:{class:{fieldName:'cellClass'}},
     // onclick: handleEditClick, // Add this line to handle the button click
  },
];

export default class MyLeaves extends LightningElement {

 
  fromDate=FROM_DATE;
  toDate=TO_DATE;
  reasonHai=REASON;
  userHai=USER;
  status=STATUS;

  // Flexipage provides recordId and objectApiName
  @api recordId;
  @api objectApiName= 'LeaveRequest__c';


  coloumn = columns;
  Myleave=[];
  myLeaveResult;
  showModalPopUp=false;
  currentUserId=Id;
  myRefreshWire;

  @wire(getMyLeave)
  getMyNewLeave(result){
  this.myLeaveResult = result;
  if(result.data){
      //Map se jo ho rha o clr k liye ho rha
       // Mapping data to Myleave array and adding class and disabling edit button based on status
      this.Myleave=result.data.map(a=>({
          ...a,
          cellClass:a.Status__c=='Approved' ? 'slds-theme_success' :a.Status__c=='Rejected' ?'slds-theme_warning' :'',
         // isEditDisable :a.Status__c != 'Pending' //for the button
      }));
  }
  if(result.error){
      result.error;
  }
}

hideModalPopUpBox(){
  console.log('hideModelMethod chekc')
  this.showModalPopUp = false;
}

clickMe(){
  this.showModalPopUp = true;
  this.recordId='';
}

  addRowDataTable(event){
  this.showModalPopUp=true;
  this.recordId=event.details.record.Id
 }
  
  successHanler(){
    this.showModalPopUp=false;
    this.showToast();
    refreshApex(this.myRefreshWire);
}

submitHandler(event){
event.preventDefault();
const fields = {...event.detail.fieldS};

  if(new Date(fields.fromDate) > new Date(fields.toDate)){
    this.showToast('From date shouold not be greater than the to Date', 'Error');
  }
  else if(new Date()> new Date(fields.fromDate)){
    this.showToast('From date shouold not be less than the to Date', 'Error');
  }
  else{
    this.refs.leaveRequestFrom.submit(fields);
  }
}

showToast(){
  const evt = new ShowToastEvent({
      title: 'Toast Success',
      message: 'Record Saved successfully',
      variant: 'success',
      mode: 'dismissable'
  });
  this.dispatchEvent(evt);
}

}