import { wire, api, LightningElement } from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import TYPE from '@salesforce/schema/Account.Type';
import SLA from '@salesforce/schema/Account.SLA__c';

const fields = [TYPE, SLA ];


export default class CorrectRecordIdCompo extends LightningElement {
    @api recordId;
    @wire(getRecord, { recordId: '$recordId', fields })
      account;
   
   
   get type() {
          return getFieldValue(this.account.data, TYPE);
      }
   
   get sla(){
          return getFieldValue(this.account.data, SLA);
      }
   
   
  }