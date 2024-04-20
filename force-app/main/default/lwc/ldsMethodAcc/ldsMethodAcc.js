import { LightningElement  } from 'lwc';
 import accountProviderclass from '@salesforce/apex/AccountProvider.accountProviderclass';
export default class LdsMethodAcc extends LightningElement {
  
  accObject = {'sObjectType' : 'Account'};
  
 
  accHandler(){

    this.accObject.Name=this.template.querySelector('lightning-input[data-formfield="accName"]').value; 
    this.accObject.Type=this.template.querySelector('lightning-input[data-formfield="acctype"]').value; 
    
    accountProviderclass({objacc : this.accObject })
    .then(result=>{
     console.log('record created succesfully');
    })
    .catch(error=>{
      console.log('lochaa');
    });
  }
}