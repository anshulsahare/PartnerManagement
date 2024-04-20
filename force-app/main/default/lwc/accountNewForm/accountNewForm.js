import { LightningElement,track,wire } from 'lwc';
import accountProviderclass from '@salesforce/apex/AccountProvider.accountProviderclass';
export default class AccountNewForm extends LightningElement {


   @track accRecord;
   @track accError;
    @wire(accountProviderclass) newAccountMethod({

    error,data
}){
    if(data){
        this.accRecord=data;
    }
    if(error){
        this.accError=error;
    }
}

}