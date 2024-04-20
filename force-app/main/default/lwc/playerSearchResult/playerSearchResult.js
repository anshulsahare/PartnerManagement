import { LightningElement,wire,api } from 'lwc';
import cricketResultProviderMethod from '@salesforce/apex/cricketResultProvider.cricketResultProviderMethod';
import  updateCricket from '@salesforce/apex/cricketResultProvider.updateCricket';

export default class PlayerSearchResult extends LightningElement {
  
   nationalPickReceiver=''; //received picklist value storer from parent compo
  cricketerDataStorer;
  selectedPlayerId;//to store the Id of player when we click on any player
  selectedPlayerName;
  
 //updaterecord
  showUpdatePopup = false;
    updatedPlayerId;
    updatedPlayerName;
    updatedRuns;


  @wire(cricketResultProviderMethod , {nationalPicApex : '$nationalPickReceiver'} )
   cricketList({data,error}){
    if(data){
      this.cricketerDataStorer=data;
      console.log('this.cricketerDataStorer'+JSON.stringify(this.cricketerDataStorer));
    }
    else if(error){
      console.error('Error'+JSON.stringify(error));
    }
   }

   handleClickPlayerCard(event){
    this.selectedPlayerId=event.currentTarget.dataset.id; //(currentTarget.dataset.id;) use to get the Id from data-id={player.Id} line 7
    this.selectedPlayerName = event.currentTarget.dataset.cricketerName;
    console.log('this.selectedPlayerName ',JSON.stringify(this.selectedPlayerName));
    console.log('this.selectedPlayer'+JSON.stringify(this.selectedPlayerId));
  
                                                // querySelectorAll('.selected')-> class k basis pr serahc kr rhe
    let boxClass = this.template.querySelectorAll('.selected');
      if(boxClass.length > 0){ //liye hh ki if apn MSD ko selct kre & then Raina ko to msd ka border htna chahiye
        this.removeClass();   
      }

      //current selected player card details
                                     //querySelector(`[data-id= -> id k basis pr search kr rhe h          
      let playerBox =  this.template.querySelector(`[data-id="${this.selectedPlayerId}"]`);
      
      //aaplying class & his css file on playerBox
      if(playerBox){
        playerBox.className='title warpper selected';
      }

      //Sending value to parent  using dispatch event
   this.dispatchEvent(new CustomEvent('select',{
    detail :{
      playerId :  this.selectedPlayerId,
      playerName : this.selectedPlayerName
    }
   }))

   }

   removeClass(){
    this.template.querySelectorAll('.selected')[0].classList.remove('selected');
   }
 
   //api isiliye use taki parent compo method ko access kr ske
   @api nationalPicklistReceiver(nationalPick){
    console.log('nationalPick'+JSON.stringify(nationalPick));
    this.nationalPickReceiver=nationalPick;
    console.log('this.nationalPickReceiver'+JSON.stringify(this.nationalPickReceiver));
   }

   //to update the record
   
    handleOptionsClick(event) {
        this.updatedPlayerId = event.currentTarget.dataset.id;
        this.showUpdatePopup = true;
    }

    handleNameChange(event) {
        this.updatedPlayerName = event.target.value;
    }

    handleRunsChange(event) {
        this.updatedRuns = event.target.value;
    }

    handleSave() {
        if (this.updatedPlayerName && this.updatedRuns) {
        updateCricket({ objacc: { Cricketer_Name__c: this.updatedPlayerName, Run__c: this.updatedRuns } })
            .then(result => {
                console.log('Result = ' + JSON.stringify(result));
                // Optionally, you may want to refresh the data to reflect the changes
                this.refreshData();
            })
            .catch(error => {
                console.error('Error = ' + JSON.stringify(error));
                // Handle errors in a way that suits your requirements
            });

        this.showUpdatePopup = false;
     }
    }
    handleCancel() {
        this.showUpdatePopup = false;
    }

   
}