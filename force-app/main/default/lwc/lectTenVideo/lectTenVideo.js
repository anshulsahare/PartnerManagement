import { LightningElement ,api,wire} from 'lwc';
import getConList from '@salesforce/apex/contactProvider.getConList';

export default class LectTenVideo extends LightningElement {

    @api recordID;

    @wire (getConList , {accId : '$recordID'})
    conlistStore;
}