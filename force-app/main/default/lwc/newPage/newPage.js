import SystemModstamp from '@salesforce/schema/Account.SystemModstamp';
import { LightningElement } from 'lwc';

export default class NewPage extends LightningElement {

appliObject = {'sObjectType' : 'Applicant__c'}

appHandlerButton(){

    this.appliObject.First_Name__c=this.template.querySelector('ightning-input[data-formfield="appFirst"]').value;
    this.appliObject.Last_Name__c=this.template.querySelector('ightning-input[data-formfield="appLastName"]').value;
    this.appliObject.Gender__c=this.template.querySelector('ightning-input[data-formfield="appGEnder"]').value;
    this.appliObject.Pan_Card__c=this.template.querySelector('ightning-input[data-formfield="appPanCard"]').value;
    this.appliObject.Phone_Number__c=this.template.querySelector('ightning-input[data-formfield="appPhone"]').value;

    console.log('Name'+this.appliObject.First_Name__c+' lastName '+this.appliObject.Last_Name__c);

}

}