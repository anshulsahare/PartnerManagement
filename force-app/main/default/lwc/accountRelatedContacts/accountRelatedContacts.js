import { LightningElement , wire} from 'lwc';
import  getAccounts from "@salesforce/apex/getRecordDataController.getaccountlist";
import getContacts from "@salesforce/apex/getRecordDataController.getcontacttlist";


export default class AccountRelatedContacts extends LightningElement {
    acclist; conList;accConList; 
    showRelatedContacts=false;accId;filteredConList;selectedAccId;accountId;

    @wire(getContacts) wiredContacts({ data, error }) {
        if (data) {
            //  console.log("conList ", data);
            this.conList = data;
            //  console.log("conList ", this.conList);
        } else if (error) {
            console.log(error);
        } 
    }
  
    @wire(getAccounts) wiredAccounts({ data, error }) {
        if (data) {        
            this.acclist = data;
            //  console.log("accList ", this.acclist);        
        } else if (error) {
            console.log(error);
        }
    }

    handleClick(event){
         alert("button is clicked");
        let selectedAccId = event.target.name;   
        this.accountId=selectedAccId;
        let selectedAccLocalId = event.target.Id;             
        this.showRelatedContacts=!this.showRelatedContacts;
        this.filteredConList = this.conList.filter(function(currentItem,Index,array){
            if(currentItem.AccountId==selectedAccId){
                return currentItem;
            }
        });
    }
}