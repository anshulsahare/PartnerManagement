trigger CaseTriggerPractise on Case (after insert, after update) {
    
    set<Id> accIdSet = new set<Id>();
    for(Case objcase : trigger.new){
        accIdSet.add(objcase.AccountId);
    }
    
    Map<Id, Account> accMap = new  Map<Id, Account>();
    for(Account objacc : [select Id, Rating from Account where Id IN : accIdSet ]){
        accMap.put(objacc.Id, objacc);
    }
    
    for(Case objcase : trigger.new){
        if(accMap.containskey(objcase.AccountId)){
            if( (objcase.Priority=='High') || (objcase.Priority=='Medium') ){
                accMap.get(objcase.AccountId).Rating='Hot';
            }
            else{
                accMap.get(objcase.AccountId).Rating='';
            }
        }
    }
    if(!accMap.isEmpty()){
        database.update(accMap.values(), false);
    }
    
}