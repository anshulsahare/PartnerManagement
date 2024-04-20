trigger Scenario8Contact on Contact (before insert, before update) {
     set<Id> accidset = new set<Id>();
         if((trigger.isbefore && trigger.isinsert) || (trigger.isbefore && trigger.isupdate)){
         for(Contact objcon : trigger.new){
            accidset.add(objcon.AccountId);
            }
    
   map<Id,Account> accmap = new map<Id,Account>();
             if(!accidset.isEmpty()){
            for(Account objacc : [select Id,Total_Ammount_1__c,Total_Ammount_2__c ,(select Ammount1__c,Ammount2__c from Contacts)from Account where Id IN:accidset]){
            accmap.put(objacc.Id, objacc);
            }
            }
    
             if(!accmap.isEmpty()){
    for(Contact objcon:trigger.new){
            if(accmap.containskey(objcon.AccountId)){
            accmap.get(objcon.AccountId).Total_Ammount_1__c=objcon.Ammount1__c;
            accmap.get(objcon.AccountId).Total_Ammount_2__c=objcon.Ammount2__c;
              }
             }
            }
             database.update(accmap.values(), false);
    }

}