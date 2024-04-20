global class Batch1AccRatingUpdt implements Database.Batchable <sObject>{

    global database.QueryLocator start(database.BatchableContext BC){
     return Database.getQueryLocator('select Id,Rating,Type from Account where Rating!=\'Hot\' and Type=\'Prospect\' ');  
    }
    global void execute(database.BatchableContext BC, list<Account> acclist){
        if(!acclist.isEmpty()){
            for(Account objacc : acclist){
                if(string.isBlank(objacc.Rating)){
                objacc.Rating='Hot';
              }
            }
            database.update(acclist, false);
        }
    }
    global void finish(Database.BatchableContext BC){
      Database.executeBatch(new Batch2OppStageUpdtASSI2());
    }
}