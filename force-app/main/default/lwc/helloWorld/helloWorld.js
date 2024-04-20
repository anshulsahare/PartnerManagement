import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class HelloWorld extends LightningElement {


    ClickButton(){
        const event = new ShowToastEvent({
            title: 'Utility',
            variant: 'success',
            message:
                'Hello, Im from Utility Bar',
        });
        this.dispatchEvent(event);
    }

}