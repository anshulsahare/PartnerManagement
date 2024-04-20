global class BatchclassAccountRatingUpdate implements database.batchable<sObject>{
    global database.QueryLocator start(database.BatchableContext BC){
    string strvar = 'select Id,Name,SLA__c,Rating from Account where SLA__c= \'Gold\' And Rating!= \'Cold\' ';
        return database.getQueryLocator(strvar);  
    }
    global void execute(database.BatchableContext BC , list<Account> acclist){
        if(!acclist.isEmpty()){
        for(Account objacc : acclist){
            objacc.Rating='Cold';
        }
         database.update(acclist, false);
       }
      }
    global void finish(database.BatchableContext BC){
        
    }
}