import { LightningElement, track } from 'lwc';
import accoundCreate from '@salesforce/apex/accoundProviderFourth.accoundCreate';
export default class WireTrackUsed extends LightningElement {
   @track accObject = {'sObjectType' : 'Account'}
   flag=false;
   
    showHandlerButton(){
        this.flag=true;
        this.accObject.Name = this.template.querySelector('lightning-input[data-formfield="Name"]').value; 
        console.log('You have entered = '+this.accObject.Name);

        accoundCreate({ objacc : this.accObject })
        .then(result=>{
                console.log('result = '+result);
        })
        .catch(error=>{
             console.log('error = '+error);
        })
    }

}