trigger basic on Account (before insert, before update) {
    
    if(trigger.isInsert && trigger.isBefore){
        Basicone.updateAccountHistory(trigger.new, trigger.oldmap);
    }
    else if(trigger.isupdate && trigger.isBefore){
        Basicone.updateAccountHistory(trigger.new, trigger.oldmap);
    }
  }