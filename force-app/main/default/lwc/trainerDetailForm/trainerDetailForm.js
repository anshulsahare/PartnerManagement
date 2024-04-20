import { LightningElement,api,wire } from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import TRAINER_FIELD from '@salesforce/schema/Pokemon__c.Trainer__c';

const pokemonField =[TRAINER_FIELD];

export default class TrainerDetailForm extends LightningElement {
    @api recordId;

    @wire(getRecord,{recordId :'$recordId', fields:pokemonField})
    pokemon;

    get trainerId(){
        return getFieldValue(this.pokemon.data, TRAINER_FIELD )
    }
}