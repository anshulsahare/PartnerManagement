import { LightningElement,api } from 'lwc';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import RATING_FIELD from '@salesforce/schema/Account.Rating';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';

export default class ForPractice extends LightningElement {

  // Expose a field to make it available in the template
  nameField = NAME_FIELD;
  ratingField = RATING_FIELD;
   phoneField = PHONE_FIELD;

  // Flexipage provides recordId and objectApiName
  @api recordId;
  @api objectApiName= 'Account';

}