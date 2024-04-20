import { LightningElement , track} from 'lwc';
import pubSubModel from 'c/pubSubModel';

export default class PubSubModelB extends LightningElement {

    @track messageStorer;
    connectedCallback(){
        this.callSubscriber();
    }

    callSubscriber(){
        //subsribe is a method which created in pubSubModel which received EVENT & CALLBACK
        console.log('Subscribing to event...');
        pubSubModel.subscribe ('componentA' , (message)=> {
            console.log('Received event:', message);
            this.messageStorer=message;
        })
    }
}