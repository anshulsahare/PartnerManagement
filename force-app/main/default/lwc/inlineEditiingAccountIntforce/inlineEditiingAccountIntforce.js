import { LightningElement,track, wire } from 'lwc';
import accountProviderclass from '@salesforce/apex/AccountProvider.accountProviderclass';

const coloumn = [
 {label : 'Name', fieldname :'Name',type :'text'},
 {label : 'Phone', fieldname :'Phone',type :'text'},
 {label : 'Industry', fieldname :'Industry',type :'text'},
 {label : 'Email ID', fieldname :'Email_ID__c',type :'email'},
];

export default class InlineEditiingAccountIntforce extends LightningElement {
 
    coloumns =coloumn;
    @track accObj;
    fldsItemValues = [];

    @wire (accountProviderclass)
     cons(result){
        this.accObj = result;
     };

     saveHandleAction(event) {
        this.fldsItemValues = event.detail.draftValues;
        const inputsItems = this.fldsItemValues.slice().map(draft => {
            const fields = Object.assign({}, draft);
            return { fields };
        });
 
       
        const promises = inputsItems.map(recordInput => updateRecord(recordInput));
        Promise.all(promises).then(res => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success',
                    message: 'Records Updated Successfully!!',
                    variant: 'success'
                })
            );
            this.fldsItemValues = [];
            return this.refresh();
        }).catch(error => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error',
                    message: 'An Error Occured!!',
                    variant: 'error'
                })
            );
        }).finally(() => {
            this.fldsItemValues = [];
        });
    }
 
   
    async refresh() {
        await refreshApex(this.accObj);
    }
}