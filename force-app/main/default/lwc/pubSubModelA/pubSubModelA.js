import { LightningElement } from 'lwc';
import pubSubModel from 'c/pubSubModel';
export default class PubSubModelA extends LightningElement {
    message
    inputTaking(event){
       this.message = event.target.value;
    }

    clickHandler(){
        console.log('Publishing event...');
        pubSubModel.publish('componentA', this.message)
    }

}