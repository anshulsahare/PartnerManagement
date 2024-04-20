trigger AccountToOpp on Account (after insert,after update) {
    
    Map<Id,Account> Accmap = new Map<Id, Account>();
    for(Account objacc : trigger.new){
        if(objacc.Rating != trigger.oldmap.get(objacc.Id).Rating ){
            Accmap.put(objacc.Id, objacc);
        }
    }
    list<Opportunity> opplist = new list<Opportunity>();
    if(!Accmap.isEmpty()){
        for(Opportunity objopp : [select Id, Name,DeliveryInstallationStatus__c, AccountId From Opportunity Where AccountId IN : Accmap.Keyset()]){
            opplist.add(objopp);
        }
    }
    
    if(!opplist.isEmpty()){
        for(Opportunity objopp : opplist){
            if(Accmap.containskey(objopp.AccountId)){
                if(Accmap.get(objopp.AccountId).Rating=='Hot'){
                    objopp.DeliveryInstallationStatus__c='Completed';
                }
                else{
                    objopp.DeliveryInstallationStatus__c='';
                }
            }
        }
        Database.update(opplist,false);
    }
}