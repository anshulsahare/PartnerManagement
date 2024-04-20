import { LightningElement } from 'lwc';
import crudAccountProvider from '@salesforce/apex/crudAccountProvider.crudAccountProvider';
import recordAccountRecord from '@salesforce/apex/crudAccountProvider.recordAccountRecord';
import updateAccountRecord from '@salesforce/apex/crudAccountProvider.updateAccountRecord';
import deleteAccountRecord from '@salesforce/apex/crudAccountProvider.deleteAccountRecord';

export default class CrudOperation extends LightningElement {

   accObject ={'sObjecttype' : 'Account'}
   showInputFieldFlag=true;
   searchShowButtonFlag=false;
   showAccountDetaisFlag=false;
   shopUpdateNowButtonGlag=false;
   showSaveButtonFlag=true;
   

   // for account TYPE picklist STARt
   get typeOptions() {
    return [
        { label: 'Prospect', value: 'Prospect' },
        { label: 'Customer - Direct', value: 'Customer - Direct' },
        { label: 'Other', value: 'Other' },
    ];
}
typeHandleChange(event) {
    this.accObject.Type = event.detail.value;
    console.log('you have selected = '+this.accObject.Type);
}    // for account TYPE picklist END

// for account SLA picklist STARt
get slaOptions() {
    return [
        { label: 'Gold', value: 'Gold' },
        { label: 'Silver', value: 'Silver' },
        { label: 'Bronze', value: 'Bronze' },
    ];
}
slaHandleChange(event) {
    this.accObject.SLA__c = event.detail.value;
    console.log('you have selected = '+this.accObject.SLA__c);
}   // for account SLA picklist END

    saveHandlerButton(){
      this.showInputFieldFlag=true;
      this.searchShowButtonFlag=false;
      this.showAccountDetaisFlag=false;
      this.shopUpdateNowButtonGlag=false;
      this.showSaveButtonFlag=true;
      
    }
    searchHandlerButton(){
        this.showInputFieldFlag=false;
        this.searchShowButtonFlag=true;
        this.shopUpdateNowButtonGlag=false;
        this.showSaveButtonFlag=false;
       
        
    }
    updateHandlerButton(){
        this.showInputFieldFlag=true;
        this.searchShowButtonFlag=false;
        this.shopUpdateNowButtonGlag=true;
        this.showSaveButtonFlag=false;
    }
    deleteHandlerButton(){

        if (confirm("Are you sure ") == true) {

        deleteAccountRecord({objacc :this.accObject })
        .then(result=>{
         console.log('record deleted succesffuly '+JSON.stringify(result));
        })
        .catch(error=>{
            console.log('something locha '+JSON.stringify(error));
        })
      }
    }
    createSaveButtonhHandler(){
       this.accObject.Name= this.template.querySelector('lightning-input[data-formfield="accName"]').value;
       crudAccountProvider({objacc : this.accObject})
       .then(result=>{
          console.log('Result = '+JSON.stringify(result));
       })
       .catch(error=>{
        console.log('error = '+JSON.stringify(error));
       })
        
    }
    searcNowhHAndlerButton(){
        this.accObject.Name= this.template.querySelector('lightning-input[data-formfield="accName"]').value;
       
        recordAccountRecord({objacc : this.accObject })
        .then(result=>{
            console.log('Result = '+JSON.stringify(result));
            this.accObject= result;
            this.showAccountDetaisFlag=true;
        })
        .catch(error=>{
            console.log('Result = '+JSON.stringify(result));
        })
    }
    updateNowButtonHandler(){
        this.accObject.Name= this.template.querySelector('lightning-input[data-formfield="accName"]').value;
        updateAccountRecord({objacc :this.accObject })
        .then(result=>{
           console.log('record updated = '+JSON.stringify(result));
           this.accObject = result;
        })
        .catch(error=>{
            console.log('something locha = '+JSON.stringify(error));
        })
        
    }
}