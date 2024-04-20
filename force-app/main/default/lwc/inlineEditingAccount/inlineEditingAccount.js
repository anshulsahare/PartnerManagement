import { LightningElement, wire,track} from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import getAccounts from '@salesforce/apex/accoundProviderFourth.getAccounts';

const columns = [
    { label: 'Id', fieldName: 'Id', type: 'text' },
    { label: 'Name', fieldName: 'Name', type: 'text'},
    { label: 'Rating', fieldName: 'Rating', type: 'text'}
  
];
export default class InlineEditingAccount extends LightningElement {
    accounts=[];
    error;
    columns = columns;
    rowLimit =40;
    rowOffSet=0;
  
    connectedCallback() {
        this.loadData();
        console.log('this.loadData() '+this.loadData());
    }

    loadData(){
        return  getAccounts({ limitSize: this.rowLimit , offset : this.rowOffSet })
        .then(result => {
            console.log('result '+JSON.stringify(result));
            let updatedRecords = [...this.accounts, ...result];
            this.accounts = updatedRecords;
            this.error = undefined;
        })
        .catch(error => {
            this.error = error;
            this.accounts = undefined;
        });
    }

    loadMoreData(event) {
        const currentRecord = this.accounts;
        console.log('currentRecord '+currentRecord);
        const { target } = event;
        target.isLoading = true;
        console.log('target.isLoading '+target.isLoading);
        this.rowOffSet = this.rowOffSet + this.rowLimit;
        this.loadData()
            .then(()=> {
                target.isLoading = false;
            });   
    }

    
}