import { LightningElement,track } from 'lwc';

export default class ApplicantTrackDecorator extends LightningElement {

    @track appliObject = {'sObjectType' : 'Applicant__c'}
    handclick(){
this.appliObject.First_Name__c=this.template.querySelector('lightning-input[data-formfield="accName"]').value;
  console.log('result = '+this.appliObject.First_Name__c);
    }
}