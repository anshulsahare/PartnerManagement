import { LightningElement, api } from 'lwc';
import login from '@salesforce/apex/LoginUser.login';
export default class AmazonLoginPage extends LightningElement {

    userName;
    passWord;
    isError=false;
    errorMessage='';

    handlerUserName(event){
        this.userName=event.target.value;
    }

    handlerPassword(event){
        this.passWord=event.target.value;
    }

    handleLogin(){
        console.log('insdie handle Login');
        console.log('userName = '+this.userName);
        console.log('Password = '+this.passWord);

        if((this.userName !=null) && (this.passWord !=null))
        login({username:this.userName, password:this.passWord})
        .then(result=>{
            this.isError=false;
           console.log('Result ='+result);
        })
        .catch(error=>{
            console.log('error ='+JSON.stringify(error));
            this.isError=true;
            this.errorMessage=error.body.message;
        })
    }
 }