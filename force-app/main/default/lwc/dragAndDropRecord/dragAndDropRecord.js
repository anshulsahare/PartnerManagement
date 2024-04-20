import { LightningElement, wire } from 'lwc';
import accountProviderclass from '@salesforce/apex/AccountProvider.accountProviderclass';

export default class DragAndDropRecord extends LightningElement {
    
    @wire (accountProviderclass)
    accountStorer;
        
}