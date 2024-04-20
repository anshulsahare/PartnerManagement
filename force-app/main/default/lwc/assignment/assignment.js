import { LightningElement,track } from 'lwc';
import acclistget from '@salesforce/apex/AccountProvider.acclistget';

export default class Assignment extends LightningElement {

    @track columns =[
        {label:'Name', fieldName:'Name', type:'text' },
        {label:'Rating' ,fieldName:'Rating', type:'text'},
        {label:'Description', fieldName:'Description', type:'text'},
        {label:'Phone', fieldName:'Phone', type:'number'},
        {label:'Industry', fieldName:'Industry', type:'text'},
    ]
 
    app= false;
    @track listStore =[]; 
    accountNameValue ='';
    handleAccountNameChange(event){
     this.accountNameValue =  event.target.value;
    }

    handleSearch(){
        console.log('Inside handleSearch method ');
        acclistget({accName : this.accountNameValue})
        .then(result=>{
         this.listStore = result;
         this.app=true;
         console.log('RESULT ='+JSON.stringify(result))
        })
        .catch(error=>{
         console.log('error'+error);
        })
    }
}