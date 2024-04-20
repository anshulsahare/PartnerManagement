global class BatchclsmyPracticeappli implements Database.batchable<sObject>{
    global database.QueryLocator start(Database.BatchableContext BC){
    string strvar = 'select Name,Gender__c,Special_Mark_On_Body__c, from Applicant__c where Gender__c !=\'Male\' and Gender__c != \'Female\' ';
    return database.getQueryLocator(strvar);    
    }
    global void execute(Database.BatchableContext BC, list<Applicant__c> applist){
        if(!applist.isEmpty()){
        for(Applicant__c objapp : applist){
            objapp.Special_Mark_On_Body__c='shitt yrrrr';
         }
        }
         database.update(applist, false);
    }
    global void finish(Database.BatchableContext BC){
        
    }
        
}