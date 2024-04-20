import { LightningElement } from 'lwc';
import createNewContact from '@salesforce/apex/contactProvider.createNewContact'

export default class ContactInsertForm extends LightningElement {

    conName;
    conLast;
    conPhoneNumber;
    conEmailId;

    handlerButton(){
        this.conName=this.template.querySelector('lightning-input[data-formfield="contactName"]').value;
        this.conLast=this.template.querySelector('lightning-input[data-formfield="contactLastName"]').value;
        this.conPhoneNumber=this.template.querySelector('lightning-input[data-formfield="contactphone"]').value;
        this.conEmailId=this.template.querySelector('lightning-input[data-formfield="contactemail"]').value;
        
        console.log('inside of js method '+this.conName);

        createNewContact({ ConFirstName : this.conName, conLastName:this.conLast ,Conphone:this.conPhoneNumber , conEmail:this.conEmailId })
        .then(result=>{
            console.log('new contact has been created');
        })
        .catch(error=>{
            console.log('something locha....');

        })
    }
}