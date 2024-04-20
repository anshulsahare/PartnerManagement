global class Batch2OppStageUpdtASSI2 implements Database.Batchable<sObject>{

    global Database.QueryLocator start(Database.BatchableContext BC){
     return Database.getQueryLocator('select Id, StageName from Opportunity where StageName !=\'Closed Won\' and Account.Rating=\'Hot\'  ');  
    }
    global void execute(Database.BatchableContext BC, list<Opportunity> opplist){
        if(!opplist.isEmpty()){
            for(Opportunity objopp :opplist){
                if(string.isNotBlank(objopp.StageName)){
                    objopp.StageName='Closed Won';
                    }
                 }
            Database.update(opplist,false);
          }
    }
    global void finish(Database.BatchableContext BC){
        
    }
}