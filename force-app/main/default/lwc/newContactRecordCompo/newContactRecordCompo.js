import { LightningElement } from 'lwc';
import OBJCON from '@salesforce/schema/Contact';
import FIRSTNAME_FIELD from '@salesforce/schema/Contact.FirstName';
import LASTNAME_FIELD from '@salesforce/schema/Contact.LastName';
import LEVEL_FIELD from '@salesforce/schema/Contact.Level__c';
import SALUATION_FIELD from '@salesforce/schema/Contact.Salutation';
import MOBILE_FIELD from '@salesforce/schema/Contact.MobilePhone';



export default class NewContactRecordCompo extends LightningElement {
contactObject = OBJCON;
myField = [FIRSTNAME_FIELD, LASTNAME_FIELD, LEVEL_FIELD, SALUATION_FIELD, MOBILE_FIELD ];


    handler(){
        console.log('created ');
    }
}