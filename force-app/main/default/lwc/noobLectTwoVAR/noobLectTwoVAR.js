import { LightningElement } from 'lwc';

export default class NoobLectTwoVAR extends LightningElement {

    mytitile='Salesforce Noob';

    connectedCallback(){
       const totalReceiver = this.handleClick(10,2);
        window.alert('Total Receiver by row function = '+totalReceiver);
    }
    
    handleClick = (divident,divisior) =>{
     return (divident/divisior);
    }
}