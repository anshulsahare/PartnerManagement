trigger Scenario1Contact on Contact (before insert, before update, after undelete) {

    set<Id> accidset= new set<Id>();
          if(trigger.IsInsert || trigger.IsUpdate || trigger.Isundelete){
           for(Contact objcon :trigger.new){
             accidset.add(objcon.AccountID);
             }
           }
   
  Map<ID,Account> accmap = new MAp<Id,Account>();
    if(!accidset.IsEmpty()){
            for(Account objacc : [select Id,(select Id from Contacts) from ACcount where Id IN : accidset]){
             accmap.put(objacc.Id, objacc);
             }
           }
    
if(!accmap.isEmpty()){
            for(Contact objcon : trigger.new){
           if(accmap.containsKey(objcon.AccountId)){
             list<Contact> conlist = accmap.get(objcon.AccountId).Contacts;{
             if(conlist.size()>0){
             objcon.adderror('this account had a already contact');
            }
           }
          }
        }
    }
}