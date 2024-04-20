import { LightningElement,track } from 'lwc';

export default class ShowAccountList extends LightningElement {
 
    @track isCallReminderToggleChecked = false;
    @track isGlobalConnectToggleChecked = false;
    @track isAfterCallToggleChecked = false;
    @track isLastCallToggleChecked = false;
    @track isShowIvrToggleChecked = false;
    value='None';
   get options() {
        return [
            { label: 'India', value: '+91' },
            { label: 'Australia', value: '+85' },
            { label: 'USA', value: '+86' },
        ];
    }


    handleCallReminderToggleChange(event) {
        this.isCallReminderToggleChecked = event.target.checked;
    }

    handleGlobalConnectToggleChange(event) {
        this.isGlobalConnectToggleChecked = event.target.checked;
    }

    handleAfterCallToggleChange(event){
        this.isAfterCallToggleChecked=event.target.checked;
    }

    handleLastCallToggleChange(event){
        this.handleLastCallToggleChange=event.target.checked;
    }

    handleShowIvrToggleChange(event){
        this.isShowIvrToggleChecked=event.target.checked;
    }

    handleDefaultNumClick(){
        alert('Inside arrow button');
    }

    handleCountryCodeChange(event) {
        this.value = event.detail.value;
        console.log('this.value ',this.value );
    }
}