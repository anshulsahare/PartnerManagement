import { LightningElement } from 'lwc';
import nsdlReciverSourcClass from '@salesforce/apex/nsdlReciverSourcClass.nsdlReciverSourcClass';

export default class NsdlProvider extends LightningElement {
    panCardNumber;
    showResult;
    handlerVerify(){
        this.panCardNumber=this.template.querySelector('lightning-input[data-formfield="panName"]').value;
    console.log('recived = '+this.panCardNumber);

    nsdlReciverSourcClass({'panCard' : this.panCardNumber})
    .then(result=>{
        console.log("Result = "+JSON.stringify(result));
         

    })
    .catch(error=>{
        console.log('error '+error);
    })
  }
}