import { LightningElement,wire } from 'lwc';
import accToConProvider from '@salesforce/apex/accProviderClass.accToConProvider';
export default class ParentFetchAccountCompo extends LightningElement {

   @wire (accToConProvider) accounts;
   accountIdNew;
   handleClick(event){
    event.preventDefault();
    this.accountIdNew=event.target.dataset.accountId;
   }

}