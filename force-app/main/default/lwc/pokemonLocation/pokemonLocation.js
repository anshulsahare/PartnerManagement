import { LightningElement,api,wire } from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';

const NAME = 'Pokemon__c.Name';
const LATITUDE = 'Pokemon__c.Location__Latitude__s';
const LONGITUDE = 'Pokemon__c.Location__Longitude__s';
const pokemonFields = [NAME,LATITUDE,LONGITUDE ];

export default class PokemonLocation extends LightningElement {

    @api recordId;
    name;
    mapMarker=[];
    cardTitle;

    @wire(getRecord, {recordId:'$recordId', fields:pokemonFields})
        getPokemons({error, data}){
            if(error){
                console.error('error',JOSN.stringify(error));
            }
            else if(data){
                this.name = getFieldValue(data, NAME);
                this.cardTitle = this.name;
                const Latitude = getFieldValue(data,LATITUDE);
                const Longitude = getFieldValue(data,LONGITUDE);
 
                this.mapMarker = [{
                    location : {Latitude,Longitude},
                    cardTitle : this.name,
                    description : `Coords : ${Latitude}, ${Longitude}`
                }]

                console.log('this.mapMarker '+JSON.stringify(this.mapMarker));
            }
        }
    }
    
