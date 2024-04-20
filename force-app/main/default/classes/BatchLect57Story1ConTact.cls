global class BatchLect57Story1ConTact implements Database.Batchable<sObject>, Database.stateful{

     global integer count=0;
    global Database.QueryLocator start(Database.BatchableContext BC){  
     return Database.getQueryLocator('select Id,Level__c from Contact  ');
      
    }
    global void execute(Database.BatchableContext BC, list<Contact> conlist){
        if(!conlist.isEmpty()){
            for(Contact objcon : conlist){
                objcon.Level__c='Secondary';
                count++;
            }
            Database.update(conlist, false);
            
           
        }  
    }
    global void finish(database.BatchableContext BC){
        System.debug('Count Total Record ='+count);
        
    }
}