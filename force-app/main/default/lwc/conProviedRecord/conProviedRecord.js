import { LightningElement,api,wire } from 'lwc';
import conMethod from '@salesforce/apex/contactProviedClass.conMethod';

export default class ConProviedRecord extends LightningElement {

    columns = [
        {label: 'First Name', fieldName:'FirstName'},
        {label: 'Last Name', fieldName:'LastName'},
        {label: 'Email ID', fieldName:'Email'},
    ];

    @api accountId;
    @wire (conMethod, {accountId : '$accountId'}) contacts;
}