import { LightningElement,api } from 'lwc';

export default class SetterChild extends LightningElement {

    userDetails //property
    @api 
    get details(){
      // whatever the data comes it will return
      return this.userDetails;
    }
    //we know set received the Data
    set details(data){
     //creating shallow copy by using spread operator
     let newAge = data.age*2
     this.userDetails= {...data, age:newAge, "Currentlocation" : "Ahemdabad"}
     //RIght hand value override the left hand value

    }

}