trigger contactAmmoutTrigger on Contact (after insert, after update) {
 set<Id> accIdset = new set<Id>();
 for(Contact objcon : trigger.new){
 if(objcon.AccountId != null){
   accIdset.add(objcon.AccountId);
  }
 }
  
  Map<Id,Account> accMap= new Map<Id,Account>();
  if(!accIdset.isEmpty()){
  for(Account objacc : [select Id, Total_Ammount_1__c from Account where ID IN : accIdset ]){
    accmap.put(objacc.Id, objacc);
    }
  }
  
  for(Contact objcon : trigger.new){
  if(accMap.Containskey(objcon.AccountId)){
   accmap.get(objcon.AccountId).Total_Ammount_1__c = objcon.Ammount1__c;
   accmap.get(objcon.AccountId).Total_Ammount_2__c = objcon.Ammount2__c;
   }
  }
  if(!accMap.isEmpty()){
  database.update(accMap.values(), false);
   }
}