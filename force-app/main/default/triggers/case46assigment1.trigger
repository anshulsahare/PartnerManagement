trigger case46assigment1 on Case (after insert, after update) {
    set<Id> accset = new set<Id>();
    for(Case objcase : trigger.new){
        if(objcase.AccountId != null)
        accset.add(objcase.AccountId);
    }
    
    map<Id, Account> accmap = new map<Id, Account>();
    for(Account objacc : [select id,Rating from Account where ID IN : accset]){
        accmap.put(objacc.Id, objacc);
    }
    
    for(Case objcase : trigger.new){
        if(accmap.containsKey(objcase.AccountId)){
            if(objcase.Priority=='High' || objcase.Priority=='Medium'){
                accmap.get(objcase.AccountId).Rating='Hot';
            }
            else{
                accmap.get(objcase.AccountId).Rating='';
            }
        }  
    }
    
    if(accmap.isEmpty())
        database.update(accmap.values(), false);
}