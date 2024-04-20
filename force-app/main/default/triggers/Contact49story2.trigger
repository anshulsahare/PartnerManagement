trigger Contact49story2 on Contact (after insert,after update,after delete, after undelete) {
 set<Id> accidset = new set<Id>();
    if((trigger.IsAfter && trigger.IsInsert) || (trigger.IsAfter && trigger.IsUndelete)){
        for(Contact objcon :trigger.new){
            accidset.add(objcon.AccountId);
        }
      }
    if((trigger.IsAfter && trigger.IsUpdate) || (trigger.IsAfter && trigger.Isdelete )){
        for(Contact objcon:trigger.old){
            accidset.add(objcon.AccountId);
        }
      }
    
    map<Id,Account> accmap = new map<Id,Account>();
    if(!accidset.isEmpty()){
    for(Account objacc : [select id,Count_Of_Contacts__c,(select Id from Contacts) from Account where Id IN:accidset]){
          list<Contact> conlist = objacc.Contacts;
           objacc.Count_Of_Contacts__c=conlist.size();
          accmap.put(objacc.Id, objacc);
    }
   }
    if(!accmap.isEmpty()){
    database.update(accmap.values(), false);
    }
}