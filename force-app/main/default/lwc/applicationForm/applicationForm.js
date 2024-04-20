import { LightningElement } from 'lwc';

export default class ApplicationForm extends LightningElement {

    name;

    handlerButton(){
        console.log('YES');
        this.name=this.template.querySelector('lightning-input[data-formfield="name"]').value;
    }
}