trigger countConTrigger on Contact (after insert, after update, after delete, after undelete) {

    set<Id> accIdset = new set<Id>();
   for(Contact objcon : trigger.new){
     if(objcon.AccountId != null){
     accIdset.add(objcon.AccountId);
     }
    }
    
    Map<Id,Account> accMap = new Map<Id,Account>();
    if(!accIdset.IsEmpty()){
    for(Account objacc : [select Id ,Count_Of_Contacts__c, (select Id from contacts) from Account where Id IN : accIdset ]){
        List<Contact> conlist =objacc.contacts;
        objacc.Count_Of_Contacts__c=conlist.size();
        accMap.put(objacc.Id, objacc);
      }
    }
    if(!accMap.isEmpty()){
    database.update(accMap.values(), false);
    }
 }