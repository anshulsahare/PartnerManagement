trigger countofaccToOpp on Opportunity (after insert,after delete,after update, after undelete) {
  set<Id> accIdset = new set<Id>();
  if(trigger.isInsert || trigger.isUndelete){
  for(Opportunity objopp : trigger.new){
   if(objopp.AccountId != null){
       accIdset.add(objopp.AccountId);
    }
   }
  }
  if(trigger.isDelete || trigger.IsUpdate){
  for(Opportunity objopp : trigger.old){
  if(objopp.AccountId != null){
       accIdset.add(objopp.AccountId);
     }
    }
   }
   
   Map<Id,Account> accMap= new  Map<Id,Account>();
   if(!accIdset.IsEmpty()){
   for(Account objapp :[select Id,Count_of_Opportunities__c,(select Id from Opportunities) from Account where Id IN : accIdset]){
   list<Opportunity> opplist = objapp.Opportunities;
          objapp.Count_of_Opportunities__c = opplist.size();
          accMap.put(objapp.Id, objapp);
      }
    }   
  database.update(accMap.Values(), false);
}