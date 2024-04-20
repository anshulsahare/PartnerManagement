trigger Account48story1 on Account (after update) {
    map<Id,Account> accmap= new map<Id, Account>();
    for(Account objacc :trigger.new){
        if(objacc.Type != trigger.oldmap.get(objacc.Id).Type){
            accmap.put(objacc.Id, objacc);
        }
    }
    list<Contact> conlist = new list<Contact>();
    for(Contact objcon : [select Id,LeadSource, Level__c, AccountId from Contact where AccountId  IN : accmap.keySet()]){
        conlist.add(objcon);
    }
    for(Contact objcon : conlist){
        if(accmap.containsKey(objcon.AccountId)){
            if(accmap.get(objcon.AccountId).Type=='Technology Partner'){
                objcon.LeadSource='Web';
                objcon.Level__c='Primary';
            }
            else{
                objcon.LeadSource='';
                objcon.Level__c='';
            }
        }
    }
    database.update(conlist,false);
    
    
}