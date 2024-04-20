import { LightningElement } from 'lwc';
import  appliRecord from '@salesforce/apex/applicantProviderSecond.appliRecord'

export default class ApplicantRegistrationForm extends LightningElement {
   
    appliobject = {'sObjectType' : 'Applicant__c'}
    appHolder(){


        this.appliobject.First_Name__c=this.template.querySelector('lightning-input[data-formfield="AppliName"]').value;
        this.appliobject.Last_Name__c=this.template.querySelector('lightning-input[data-formfield="AppliLastName"]').value;
        this.appliobject.Email_Id__c=this.template.querySelector('lightning-input[data-formfield="AppliEmail"]').value;
        this.appliobject.Phone_Number__c=this.template.querySelector('lightning-input[data-formfield="AppliPhone"]').value;
        this.appliobject.Gender__c=this.template.querySelector('lightning-input[data-formfield="AppliGender"]').value;
        console.log('inside of js method');

        appliRecord({objapp : this.appliobject})
        .then(result=>{
             console.log('Applicant new record has been created');
        })
        .catch(error=>{
            console.log('loch...something wrong');
        })
    }
}