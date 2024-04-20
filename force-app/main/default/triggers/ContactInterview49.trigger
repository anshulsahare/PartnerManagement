trigger ContactInterview49 on Contact (before insert, before Update, after Undelete) {
     Set<Id> Accidset  =  new set<Id>();
    if(trigger.IsInsert  || trigger.IsUpdate || trigger.IsUndelete){
        for(Contact objcon :trigger.new){
            Accidset.add(objcon.AccountId);
        }
    }
    map<Id,Account> accmap =new map<Id,Account>();
    if(!Accidset.isEmpty()){
    for(Account objacc : [select Id,(select Id from Contacts) from Account where Id IN : Accidset]){
         accmap.put(objacc.Id, objacc);
      }
    }
    if(!accmap.isEmpty()){
    for(Contact objcon : trigger.new){
        if(accmap.containsKey(objcon.AccountId)){
          list<Contact> conlist =accmap.get(objcon.AccountId).Contacts;
            if(Conlist.size()>0){
                objcon.adderror('its account already contain a contct');
            }
        }
    }
   }
}