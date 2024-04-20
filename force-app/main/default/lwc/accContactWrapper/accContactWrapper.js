import { LightningElement,wire } from 'lwc';
import fetchAccAndCons from '@salesforce/apex/accWrapperProvider.fetchAccAndCons';

export default class AccContactWrapper extends LightningElement {

    data;
    error;


    @wire(fetchAccAndCons)
    accs({error, data}) {
        if(data) {
            this.data = data;
            window.console.log('data ==> '+JSON.stringify(data));
        }
        else if(error) {
            this.error = error;
        }
    }
}