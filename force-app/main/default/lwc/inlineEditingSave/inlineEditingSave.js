import { LightningElement,track,wire } from 'lwc';
import accountProviderclass from '@salesforce/apex/AccountProvider.accountProviderclass';



const columns = [
    { label: 'Name', fieldName: 'Name',  editable: true   },
    {  label: 'Phone',fieldName: 'Phone', type: 'phone', editable: true},
    {  label: 'Rating',fieldName: 'Rating', type: 'text', editable: true},
    {  label: 'Industry',fieldName: 'Industry', type: 'text', editable: true}, 
    { label: 'Description',fieldName: 'Type', type: 'text', editable: true},
];

export default class InlineEditingSave extends LightningElement {

    coloumnlist = columns;
    dataStore = [];
    saveDraftValues = [];

    @wire(accountProviderclass)
    accountData(result){

        console.log('Result = '+JSON.stringify(result));
        if(result.data ){
            this.dataStore=result.data;
            console.log('Result vala'+JSON.stringify(result.data));
        }
        else if(result.error){
            this.dataStore=undefined;
            
        }
    }

    
}