import { LightningElement } from 'lwc';
import firstNameApplicantRecord from '@salesforce/apex/ApplicantProvider.firstNameApplicantRecord';
import deleteNameApplicantRecord from '@salesforce/apex/ApplicantProvider.deleteNameApplicantRecord';
export default class SearchAppliName extends LightningElement {

    appliObject = { 'sObjectType' : 'Applicant__c'}
    listStoredVariable;
    showDataTableFlag=false;
    selectRecordList;

    columns = [
        { label: 'FirstName', fieldName: 'First_Name__c' },
        { label: 'LastName', fieldName: 'Last_Name__c' },
        { label: 'PhoneNumber', fieldName: 'Phone_Number__c'},
        { label: 'Email', fieldName: 'Email_id__c' },
        { label: 'Gender', fieldName: 'Gender__c'},
    ];
        

    deleteHandlerButton(){

        ApplicantProvider({ appliId : this.selectRecordList, objapp : this.appliObject})
        .then(responce=>{
          console.log('Response = '+JSON.stringify(responce));
          this.listStoredVariable=responce
        })
        .catch(error=>{
            console.log('error = '+JSON.stringify(error));
        })

    }

    searchButtonHandler(){
        this.appliObject.First_Name__c=this.template.querySelector('lightning-input[data-formfield="accName"]').value;
        console.log(this.appliObject.First_Name__c);

        firstNameApplicantRecord({ objapp : this.appliObject })
        .then(result=>{
        console.log('result '+JSON.stringify(result));
        this.listStoredVariable=result;
        if(this.listStoredVariable.lenght>0 || this.listStoredVariable != null || this.listStoredVariable == 'undefined'){
          this.showDataTableFlag=true;
          
        }
        else{
            this.showDataTableFlag=false;
        }
            
        })
        .catch(error=>{
            console.log('error '+JSON.stringify(error));
            this.showDataTableFlag=false;
           
        })
    }

    selectRecordHandler(event){
    const  selectRows  = event.detail.selectRows;

    this.selectRecordList = event.details.selectRows.length;
    }

}