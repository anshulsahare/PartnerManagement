import { LightningElement, track,wire} from 'lwc';
import accountProviderclass from '@salesforce/apex/AccountProvider.accountProviderclass';

const coloumn = [
   {label :'ID', fieldName :'Id'},
   {label :'Name', fieldName :'Name'},
   {label :'Account Rating', fieldName :'Rating'},
   {label :'Email ID', fieldName :'Email_ID__c'}
];

export default class VideoSevenApi extends LightningElement {

@track coloumnhaiBhai = coloumn;
@track datastore=[];
numberList;

   @wire(accountProviderclass)
   datalist({data, error}){
      if(data){
         this.datastore=data;
         this.numberList=this.datastore.length;
      }
      else if(error){
         console.log('error'+error);
      }
   }

}