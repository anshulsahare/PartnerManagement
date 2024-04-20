import { LightningElement } from 'lwc';
import createNewAccount from '@salesforce/apex/AccountCreteRecordProvider.createNewAccount';
export default class CreateAccRecord extends LightningElement {

    accountObject = {'sObjectType' : 'Account'}

    handleSubmitButton(){
        
        this.accountObject.Name = this.template.querySelector('lightning-input[data-formfield="accountName"]').value; //Cinemax
        this.accountObject.Type = this.template.querySelector('lightning-input[data-formfield="accountType"]').value;
        this.accountObject.Rating = this.template.querySelector('lightning-input[data-formfield="accountRating"]').value;  
        
        console.log('Inside of JS Method '+ this.accName);

        createNewAccount({objAcc : this.accountObject})
        .then(result=>{
            console.log('New Account has been created...!!!!');
        })
        .catch(error=>{
            console.log('Locha, something went wrong..!!');
        });
    }
}