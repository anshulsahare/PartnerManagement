import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent' ;
import applicantProviderThirdMethod from '@salesforce/apex/applicantProviderThird.applicantProviderThirdMethod'

export default class ApplicantSerchRecord extends LightningElement {

  handlerButton=false;
  handleEditButton=true;

    applicantOject = {'sobjectType' : 'Applicant__c'};
    showSpinnerFlag=false;
    

    handlerButton(){
         debugger; 
      this.handlerButton=false;
      this.handleEditButton=true;
          this.showSpinnerFlag=true;
          this.applicantOject.Name=this.template.querySelector('lightning-input[data-formfield="appliNameID"]').value;
          console.log('inside of js method'+this.applicantOject.Name);

       applicantProviderThirdMethod({'Objapp' :this.applicantOject})
      .then(result=>{
        
        console.log('recieved in js ='+JSON.stringify(result));
        this.applicantOject=result;
        this.showSpinnerFlag=true;
        this.showSuccessToast();
      })
      .catch(error=>{
        console.log('locha...something wrong');
        this.showSpinnerFlag=false;
        this.showErrorToast();
        
      });
  }
  handleEditButton(){
    this.handlerButton=true;
    this.handleEditButton=false;

  }


  showSuccessToast(){
    const evt = new ShowToastEvent({
        title: 'Message',
        message: 'Record Found...!!!',
        variant: 'success',
        mode: 'dismissable'
    });
    this.dispatchEvent(evt);
}

showErrorToast() {
  const evt = new ShowToastEvent({
      title: 'Message',
      message: 'Record Not Found...!!!',
      variant: 'Orange',
      mode: 'dismissable'
  });
  this.dispatchEvent(evt);
}
}