import { LightningElement } from 'lwc';

export default class RegistrationForm extends LightningElement {
   
    name;
    lastName;
    contactNo;
    emailID;
    adress;
    date;
    handlerButtom(){
        
        this.name = this.template.querySelector('lightning-input[data-formfield="name"]').value;
        this.lastName =  this.template.querySelector('lightning-input[data-formfield="lastName"]').value;
        this.contactNo =  this.template.querySelector('lightning-input[data-formfield="contactNo"]').value;
        this.emailID =  this.template.querySelector('lightning-input[data-formfield="emailID"]').value;
        this.adress =  this.template.querySelector('lightning-input[data-formfield="adress"]').value;
        
        
        
    }
}