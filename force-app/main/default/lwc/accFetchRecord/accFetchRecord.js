import { LightningElement } from 'lwc';
import getAppliNameRecord from '@salesforce/apex/ApplicantProvider.getAppliNameRecord';
export default class AccFetchRecord extends LightningElement {

    appliVar = {'sObjectType' : 'Applicant__c'}
   
    appliSearchButton(){
  this.appliVar.Name= this.template.querySelector('lightning-input[data-formfield="appliName"]').value;

  getAppliNameRecord({"objapp" : this.appliVar})
   .then(reult=>{
      console.log('result '+JSON.stringify(result));
      this.appliVar=result
   })
   .catch(error=>{
    console.log('result '+JSON.stringify(error));
   })
    }
}