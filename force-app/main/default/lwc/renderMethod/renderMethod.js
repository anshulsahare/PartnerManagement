import { LightningElement } from 'lwc';


import signupTemplate from './signupTemplate.html';
import signinTemplate from './signinTemplate.html';
import renderMethod from './renderMethod.html';

export default class RenderMethod extends LightningElement {

    selectedBtn='';
    render(){
        return this.selectedBtn === 'SignUp' ? signupTemplate :
               this.selectedBtn === 'SignIn' ? signinTemplate :
               renderMethod
    }

    handleClick(event){
     this.selectedBtn = event.target.label;
    }

    sumbitHandler(event){
    console.log(` $(event.target.label) Succesfully`);
    }
}