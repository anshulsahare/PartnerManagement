trigger amountConTrigger on Contact (after insert, after update) {

   set<Id> accIdset = new set<Id>();
   for(Contact objcon : trigger.new){
     if(objcon.AccountId != null){
       accIdset.add(objcon.AccountId);
     }
   }
   
   Map<Id,Account> accMap = new Map<Id,Account>();
   if(!accIdset.isEmpty()){
   for(Account objcon : [select Id, Total_Ammount_1__c,Total_Ammount_2__c from Account where Id IN : accIdset ]){
      accMap.put(objcon.Id, objcon);
    } 
   }
   
   for(Contact objcon : trigger.new){
   if(accMap.containskey(objcon.AccountId)){
      accMap.get(objcon.AccountId).Total_Ammount_1__c=objcon.Ammount1__c;
      accMap.get(objcon.AccountId).Total_Ammount_2__c=objcon.Ammount2__c;
     }
   }
   if(!accMap.isEmpty()){
   database.update(accMap.Values(), false);
   }
}