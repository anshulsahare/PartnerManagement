import { LightningElement } from 'lwc';
import dateApplicantRecord from '@salesforce/apex/ApplicantProvider.dateApplicantRecord';

export default class FromToTodayDate extends LightningElement {

    fromDate;
    todayDate;
    dateListCollector;
    showTableFlaf=false;

    searchHanlderButton(){
        this.fromDate=this.template.querySelector('lightning-input[data-formfield="fromDatelabel"]').value;
        this.todayDate=this.template.querySelector('lightning-input[data-formfield="todayDatelabel"]').value;
        
        dateApplicantRecord({fromDateobj : this.fromDate, todayDateObj :this.todayDate  })
        .then(result=>{
           this.dateListCollector=result;
           this.showTableFlaf=true;
        })
        .catch(error=>{
            console.log('error  = '+JSON.stringify(error));
            this.showTableFlaf=false;
        })
     }
    }