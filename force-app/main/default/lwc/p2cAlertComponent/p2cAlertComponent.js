import { LightningElement,api } from 'lwc';

export default class P2cAlertComponent extends LightningElement {

    //making meeage propery is public by using api decorator
    //yha pr parent se jo bheja o aayenga & HTML me show karvayega
    @api message;
    @api cardHeading;
}