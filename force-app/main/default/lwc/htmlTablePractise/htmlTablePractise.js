import { LightningElement } from 'lwc';
import genderApplicantRecord from '@salesforce/apex/ApplicantProvider.genderApplicantRecord';

export default class HtmlTablePractise extends LightningElement {

 appliObject = { 'sObjectType' : 'Applicant__c'}
 genderListCollector;
 genderListTotalValueShow = 0;
 tableFlagShower=false;

    get appliGenderOption() {
        return [
            { label: 'Male', value: 'Male' },
            { label: 'Female', value: 'Female' },
            { label: 'Transgender', value: 'Transgender' },
        ];
    }

    apppliGenderHandleChange(event) {
        this.appliObject.Gender__c = event.detail.value;
        console.log('JAWAB = '+this.appliObject.Gender__c);

        genderApplicantRecord({ genderobj : this.appliObject})
        .then(result=>{
         this.genderListCollector=result;
         this.genderListTotalValueShow=result.length;

         if(result.length>0){
            this.tableFlagShower=true;
         }
         else{
            this.tableFlagShower=false;
         }

        })
        .catch(error=>{
            console.log('ERROR bro = '+JSON.stringify(error));
            this.tableFlagShower=false;
        })
    }
}