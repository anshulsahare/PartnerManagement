import { LightningElement,track,wire } from 'lwc';
import ContactClass from '@salesforce/apex/ContactClass.getConlist';

export default class AccountForm extends LightningElement {
 
    @track currentAccountName;
    @track searchAccountName;

handleChangeAccName(event){
this.currentAccountName = event.target.value;

  }
handleAccountSearch(){
this.searchAccountName = this.currentAccountName;
 }

@track records;
@track dataNotFound;

@wire (ContactClass,{keySearch:'$searchAccountName'})

wireRecord({data,error}){

if(data){
this.records = data;
this.error = undefined;
this.dataNotFound = '';

if(this.records == ''){
this.dataNotFound = 'There is not Contact fond related to Account name';
}

  }
else{
this.error = error;
this.data=undefined;
  }

}
    
}