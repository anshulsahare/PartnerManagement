trigger AccTypeProspUpdate on Account ( before update) {
    
    Map<Id,Account> accMap = new Map<Id,Account>();
    for(Account objacc : trigger.new){
        if(objacc.Type != trigger.oldMap.Get(objacc.Id).Type){
            accMap.put(objacc.Id, objacc);
        }
    }
    
    list<Contact> conlist = new list<Contact>();
    if(!accMap.isEmpty()){
        for(Contact objcon : [select Id, LeadSource, Level__c, AccountId from Contact where AccountId IN : accMap.keySet()]){
            conlist.add(objcon);
        }
    }
    
    for(Contact objcon : conlist ){
        if(accMap.containskey(objcon.AccountId)){
            if(accMap.get(objcon.AccountId).Type=='Prospect'){
                objcon.LeadSource='Web';
                objcon.Level__c='Primary';
            }
            else{
                objcon.LeadSource='';
                objcon.Level__c='';
            }
        }
    }
    if(!conlist.isEmpty()){
        database.update(conlist, false);
    }
}