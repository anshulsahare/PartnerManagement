import Street from '@salesforce/schema/Lead.Street';
import { LightningElement } from 'lwc';

export default class AccountFourth extends LightningElement {

    accountObject = {'sobjectType' : 'Account'};
 
    // for account type picklist=start
    get typeoption() {
        return [
            { label: 'Prospect', value: 'Prospect' },
            { label: 'Customer - direct', value: 'Customer - direct' },
            { label: 'Other', value: 'Other' },
        ];
    }
    handleTypeChange(event) {
        this.accountObject.Type = event.detail.value;
        console.log('you have selected = '+JSON.stringify(this.accountObject.Type));
    } // for account type picklist=end

    // for account SLA picklist=start
    get slaoption() {
        return [
            { label: 'Gold', value: 'Gold' },
            { label: 'Silver', value: 'Silver' },
            { label: 'Platinum', value: 'Platinum' },
            { label: 'Other', value: 'Other' },
        ];
    }
    handleSlaChange(event) {
        this.accountObject.SLA__c = event.detail.value;
        console.log('you have selected = '+JSON.stringify(this.accountObject.SLA__c));
    }// for account type picklist=end

    createHandler(){
      console.log('inside of createHandler method');
    }
    searchHandler(){
        console.log('inside of searchHandler method');
    }
    updateHandler(){
        console.log('inside of updateHandler method');
    }
    deleteHandler(){
        console.log('inside of deleteHandler method');
    }
    firstSaveHandler(){
        this.accountObject=this.template.querySelector('lightning-input[data-formfield="accountName"]').value;
        console.log('inside of firstSaveHandler method');
        
    }
}