import { LightningElement } from 'lwc';

export default class CalculatorNew extends LightningElement {
   
    Result;
    storeOne;
    storeTwo;
    valueStore=false;

    numOne(event){
        console.log("event",event)
        this.storeOne = event.target.value;
    }
    numTwo(event){
      this.storeTwo = event.target.value;
    }
    adding(event) {
       this.Result = parseInt(this.storeOne) + parseInt(this.storeTwo);
       this.valueStore=true;
    }

    Subtracting(event){
        this.Result = parseInt(this.storeOne) - parseInt(this.storeTwo);
        this.valueStore=true;
    }

    Multiplication(avent){
        this.Result = parseInt(this.storeOne) * parseInt(this.storeTwo);
        this.valueStore=true;
    }

    Division(event){
    this.Result = parseInt(this.storeOne) / parseInt(this.storeTwo);
    this.valueStore=true;
    }
}