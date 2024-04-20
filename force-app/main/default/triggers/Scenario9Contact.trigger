trigger Scenario9Contact on Contact (before insert, before update) {

     set<Id> accidset = new set<Id>();
           if((trigger.Isbefore && trigger.isinsert) || (trigger.Isbefore && trigger.isUpdate)){
               if(!accidset.isEmpty()){
            for(Contact objcon :trigger.new){
            accidset.add(objcon.AccountId);
            }
          }
    
    map<Id,Account> accmap = new map<id,Account>();
               if(!accidset.isEmpty()){
            for(Account objacc : [select id ,(select id from contacts)from Account where Id IN: accidset]){
            accmap.put(objacc.Id, objacc);
            }
           }
    
    if(!accmap.isEmpty()){
    for(Contact objcon :trigger.new){
            if(accmap.containsKey(objcon.AccountId)){
                list<Contact> conlist =accmap.get(objcon.AccountId).contacts;
                if(conlist.size()>0){
                objcon.adderror('this contact have a already account');
                }
             }
            }
           }
            
    }
    
}