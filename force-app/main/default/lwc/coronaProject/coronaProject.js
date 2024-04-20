import { LightningElement } from 'lwc';


const url="https://services9.arcgis.com/N9p5hsImWXAccRNI/arcgis/rest/services/Z7biAeD8PAkqgmWhxG2A/FeatureServer/1/query?f=json&where=Confirmed%20%3E%200&outFields=Country_Region,Confirmed,Deaths,Recovered,Last_Update,Active&orderByFields=Confirmed%20desc";
export default class CoronaProject extends LightningElement {

    connectedCallbak(){
        this.fetchData();
    }

    async fetchData(){
        let response = await fetch(url);
        let data = await response.json();
        console.log(JSON.stringify(data))
    }
}