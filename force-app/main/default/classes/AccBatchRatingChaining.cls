global class AccBatchRatingChaining implements database.Batchable<sObject>, Database.stateful {

    global database.QueryLocator start(database.BatchableContext BC){
     string strvar=  'select Id,Rating,(select Id,StageName from Opportunities) from Account where Rating=\'Hot\' '; 
        return database.getQueryLocator(strvar);
    }
    global void execute(database.BatchableContext BC, list<Account> accNewlist  ){
        Map<Id,Account> accmap = new Map<Id,Account>();
        for(Account objacc : accNewlist){
            accmap.put(objacc.Id, objacc);
        }
        list<Opportunity> opplist = new list<Opportunity>();
        for(Opportunity objopp : [select Id,StageName,AccountId from Opportunity where AccountId IN :accmap.keyset()]){
            opplist.add(objopp);
        }
        for(Opportunity objopp : opplist){
            if(accmap.containskey(objopp.AccountId)){
                if(accmap.get(objopp.AccountId).Rating=='Hot'){
                    objopp.StageName='Closed Won';
                }
            }
        }
        database.update(opplist, false);
    }
    global void finish(database.BatchableContext BC){
        
    }
    
}