import { LightningElement,wire } from 'lwc';
import {NavigationMixin} from 'lightning/navigation'
import { getPicklistValues, getObjectInfo } from "lightning/uiObjectInfoApi";
import Crickiet_Object from '@salesforce/schema/Cricket__c'
import Cricket_Nationality from '@salesforce/schema/Cricket__c.Nationality__c';

export default class PlayerSearchFilter extends NavigationMixin(LightningElement) {

    recordTypeId; 
    picklistValue; //we using to getting the picklist values
    optionArry; //we using to store the lable & value of picklist from arr
    selectedCricketerNationality;//use to store the value of picklist when user select the option from picklist
    valueStore;
    selectedPlayerId; // taking the detail value of child dispatch event
    selectedPlayerName; // taking the detail value(Name) of child dispatch event

    @wire(getObjectInfo,{objectApiName : Crickiet_Object}) //getObjectInfo iski value ObjectInfo me data & error me liya
    ObjectInfo({data, error}){                             //q ki we know wire method ka kya krna hota to
        if(error){
            console.log('error'+JSON.stringify(error));
        }
       else if(data){
           this.recordTypeId= data.defaultRecordTypeId; //defaultRecordTypeId ye apn ne consolelog se laya hh & recordTypeId me save kiya
           console.log('this.recordTypeId'+JSON.stringify(this.recordTypeId));   
        }
    }

    @wire(getPicklistValues, {recordTypeId:'$recordTypeId', fieldApiName:Cricket_Nationality })//same this video 1
    nationalityFieldValue({data,error}){
        if(error){
            console.log('error'+JSON.stringify(error));
        }
        else if(data){
            this.picklistValue=data.values; //data me dekhoge to Data me values me picklist aarhe hh to usi value ko lane k liye
            console.log('Data'+JSON.stringify(data)); //picklistValue me apn usko store kr rhe hh
            console.log('Data'+JSON.stringify(this.picklistValue));

            //lekin av v upr label and value pair me nh aarha so av apn arr me store krenge for each ka use krk
            let arr=[];
            this.picklistValue.forEach(element=>{
                arr.push({label:element.value, value:element.value})
            })
            this.optionArry=arr;//arr ki value optionArry me store kr di hh q ki udhr show krna pdega n
            console.log('this.optionArry'+JSON.stringify(this.optionArry));

            // av pura upr ka aap ek baar console me ja kr dekhna smj jayenga
        }
    }

    handleChangePicklist(event){
     this.selectedCricketerNationality=event.detail.value;
     console.log(' this.selectedCricketerNationality'+JSON.stringify(this.selectedCricketerNationality));

     //passing the value to child component
    this.template.querySelector('c-player-search-result').nationalPicklistReceiver(this.selectedCricketerNationality);

    }
    

    createCricketer(){
        console.log('inside createCricketer')
        this[NavigationMixin.Navigate]({
            type:"standard__objectPage",
            attributes:{
                objectApiName:'Cricket__c',
                actionName:'new'
            }
        })
    }

    //smj jana
    handleCustomEvent(event){
    this.selectedPlayerId=event.detail.playerId// q ki playerId me value store kr rhe n custom event me child compo k
    this.selectedPlayerName=event.detail.playerName;  
}
   

}