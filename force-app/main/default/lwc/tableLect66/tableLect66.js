import { LightningElement } from 'lwc';
import lect69AccountProvider from '@salesforce/apex/lect69AccountProvider.lect69AccountProvider';

export default class TableLect66 extends LightningElement {
    accountObject = {'sObjectType' : 'Account'}
    accList;
    accountRecordShowCount;
    showTableFlag=false;
    get getOptions() {
        return [
            { label: 'Prospect', value: 'Prospect' },
            { label: 'Customer - Direct', value: 'Customer - Direct' },
            { label: 'Other', value: 'Other' },
        ];
    }

    typeHandleChange(event) {
        this.accountObject.Type = event.detail.value;
    
        lect69AccountProvider({objacc : this.accountObject})
        .then(result=>{
    console.log('output = '+JSON.stringify(result));
             this.accList = result;
             this.accountRecordShowCount=result.length;
             if(result.length>0){
                this.showTableFlag=true;
             }
             else{
                this.showTableFlag=false;
             }
        })
        .catch(error=>{
            console.log('error '+JSON.stringify(error));
            this.showTableFlag=false;
        })
    }
}