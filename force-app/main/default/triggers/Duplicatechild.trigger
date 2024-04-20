trigger Duplicatechild on Contact (before insert,before update,after undelete) {
   
    set<Id> accIdset = new set<Id>();
    for(Contact objcon : trigger.new){
        if(trigger.IsBefore && trigger.isInsert ||trigger.isAfter && trigger.isUndelete){
        accIdset.add(objcon.AccountId);
       }
        if( trigger.IsBefore && trigger.isUpdate){
           accIdset.add(objcon.AccountId);
         }
    }
    Map<Id,Account> accMap = new Map<Id,Account>();
    if(!accIdset.isEmpty()){
    for(Account objacc : [select Id,Name,(select Id,LeadSource from Contacts) from Account where Id IN : accIdset]){
        accMap.put(objacc.Id, objacc);
      }
    }
    for(Contact objcon : trigger.new){
        if(accmap.containsKey(objcon.AccountId)){
            list <Contact> conlist = accMap.get(objcon.AccountId).Contacts;
            
            for(Contact existObj : conlist){
                objcon.LeadSource=existObj.LeadSource;
                objcon.adderror('this type of leadsource Contact record already exist in Account');
            }
        }
    }
}