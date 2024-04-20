import { LightningElement } from 'lwc';
import insertapplicantrecord from '@salesforce/apex/ApplicantProvider.insertapplicantrecord';
import getAppliNameRecord from '@salesforce/apex/ApplicantProvider.getAppliNameRecord';
import updateApplicantRecord from '@salesforce/apex/ApplicantProvider.updateApplicantRecord';


export default class CrudPractiseOperation extends LightningElement {

    appliObject = {"sObjectType" : "Applicant__c"};
    createNicheButtonFlag=false;
    showInputFieldsFlag=true;
    searhcNIcheButtonHandlerFlag=false;
    searchIdJsButtonFlag=false;
    UpdateNicheHandlerFlag=false;
    uprButtonFlag=false;
    
    get genderOpt() {
        return [
            { label: 'Male', value: 'Male' },
            { label: 'Female', value: 'Female' },
            { label: 'Transegender', value: 'Transegender' },
        ];
    }

    genderHandleChange(event) {
        this.appliObject.Gender__c = event.detail.value;
    }


    createButton(){
        this.showInputFieldsFlag=true;
        this.searhcNIcheButtonHandlerFlag=false;
        this.createNicheButtonFlag=true;
        this.UpdateNicheHandlerFlag=false;
        this.searchIdJsButtonFlag=false;
    }
    searchButton(){ 
        this.showInputFieldsFlag=false;
        this.searhcNIcheButtonHandlerFlag=true;
        this.createNicheButtonFlag=false;
        this.UpdateNicheHandlerFlag=false;
        
    }
    updateButton(){
        this.showInputFieldsFlag=true;
        this.createNicheButtonFlag=false;
        this.UpdateNicheHandlerFlag=true;
        this.searhcNIcheButtonHandlerFlag=false;
        this.uprButtonFlag=false;
    }
    deleteButton(){
        this.createNicheButtonFlag=false;
        this.UpdateNicheHandlerFlag=false;
    }
    creatSaveeButtonHandler(){
        
        this.appliObject.First_Name__c=this.template.querySelector('lightning-input[data-fromfield="appliName"]').value;
        this.appliObject.Email_Id__c=this.template.querySelector('lightning-input[data-fromfield="appliEmail"]').value;
        this.appliObject.Pan_Card__c=this.template.querySelector('lightning-input[data-fromfield="appliPan"]').value;
        this.appliObject.DOB__c=this.template.querySelector('lightning-input[data-fromfield="appliDOB"]').value;
  
        insertapplicantrecord({ objapins : this.appliObject})
        .then(result=>{
          console.log('Record Succesfully Created');
        })
        .catch(error=>{
          console.log('error');
        })
    }
    searchSearchButtonHandler(){
        this.uprButtonFlag=true;
        this.appliObject.First_Name__c=this.template.querySelector('lightning-input[data-fromfield="appliName"]').value;
        getAppliNameRecord({objapp : this.appliObject})
        .then(result=>{
        this.appliObject=result;
        this.searchIdJsButtonFlag=true;
        })
        .catch(error=>{
            console.log('Error'+JSON.stringify(error));
        })
    }

    updateUpdateHandlerButton(){
        this.appliObject.First_Name__c=this.template.querySelector('lightning-input[data-fromfield="appliName"]').value;
        updateApplicantRecord({  objapins :this.appliObject })
        .then(result=>{
            console.log('resukyt'+JSON.stringify(result));
            this.appliObject=result;

        })
        .catch(error=>{
          console.log('error'+JSON.stringify(error));
        })
    }
}