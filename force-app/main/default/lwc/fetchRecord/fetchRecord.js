import { LightningElement ,api,wire,track } from 'lwc';
import contactFetcher from '@salesforce/apex/FetchRecordProvider.contactFetcher';
export default class FetchRecord extends LightningElement {

    
    @track conlist;
    @track conerror;
    @wire (contactFetcher) newContactMethod({
       error, data 
    }){
       if(data){
        this.conlist=data;
       }
       if(error){
        this.conerror=data;
       }
    }
}