trigger accTriggerBro on Account (before insert, after insert,before update, after update) {
    
    //INSERT Opertation
    if(trigger.Isinsert){
        if(trigger.isBefore){
            accHandlerProvider.beforeInsertMethod(trigger.new);
        }
        else{
            if(trigger.isAfter){
                accHandlerProvider.afterInsertMethod(trigger.new);
            }
        }
    }
    
    //UPDATE Opertation
    if(trigger.Isupdate){
        if(trigger.IsBefore){
            accHandlerProvider.beforeUpdateOpprtunity(trigger.new, trigger.oldMap);    
        }
        if(trigger.IsAfter){
            accHandlerProvider.afterUpdateOpprtunity(trigger.new, trigger.oldMap);    
        }        
    }
}