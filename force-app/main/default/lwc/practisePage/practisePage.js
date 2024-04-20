import { LightningElement,wire,track,api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class PractisePage extends LightningElement {
 
 selectedGenderValue='';
 @track contacts = [];
    genderOption=[
     {label:'Male', value:'Male'},
    {label:'Female', value:'Female'},
     {label:'Nonbinary', value:'Nonbinary'},
     {label:'Not Listed', value:'Not Listed'},
 ]

 handleChangeGender(event){
     this.selectedGenderValue=event.detail.value;
     console.log('this.selectedGenderValue'+this.selectedGenderValue);
 }

connectedCallback() {
   this.handleAddRecord();
}
 handleAddRecord(event){
     this.contacts.push({
         tempId : Date.now()
     })
 }
 handleDeleteClick(event){
    if( this.contacts.length===1){
        this.showToast();
    }
    else{
        let tempId = event.currentTarget.dataset.tempId;
        this.contacts = this.contacts.filter(a => a.tempId != tempId)
        }
    }
  

  showToast() {
    const event = new ShowToastEvent({
        title: 'Error',
        variant: 'error',
        message:'You Cant delete the last row of Contact',
    });
    this.dispatchEvent(event);
 }
  saveHandlerButton(){
     alert('you click saveHandlerButton');
}
}