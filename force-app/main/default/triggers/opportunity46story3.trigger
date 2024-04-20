trigger opportunity46story3 on Opportunity (after insert, after update) {
    set<ID> accset = new set<ID>();
    for(Opportunity objopp : trigger.new){
       if(objopp.AccountId !=null)
        accset.add(objopp.AccountId); 
    }
     
    map<ID, Account> accmap = new map<ID, Account>();
    for(Account objacc :[select Id,SLA__c from Account where id IN : accset]){
        accmap.put(objacc.id, objacc);
    }
    
    for(Opportunity objopp : trigger.new){
        if(accmap.containsKey(objopp.AccountId)){
            if(objopp.Amount<=18000 && objopp.StageName=='Closed Lost'){
                accmap.get(objopp.AccountId).SLA__c='Silver';
            }
            else{
                accmap.get(objopp.AccountId).SLA__c='';
            }
         } 
    }
      if(!accmap.isEmpty())
          database.update(accmap.values(), false);
          
}