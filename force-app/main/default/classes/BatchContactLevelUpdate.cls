global class BatchContactLevelUpdate implements Database.Batchable<sObject> {

    global Database.QueryLocator start(Database.BatchableContext BC){
        system.debug('from first method');
    string strvar = 'select Id,Level__c	,Email from Contact';
    return database.getQueryLocator(strvar);
        }
    global void execute(Database.BatchableContext BC, list<Contact> conlist){
        if(!conlist.isEmpty()){
        for(Contact objcon : conlist){
            if(string.isBlank(objcon.Email)){
                objcon.Level__c='Primary';
            }
            else{
                objcon.Level__c='';
            }
        } 
            database.update(conlist,false);
            system.debug('from execute method');
      }
    }
    global void finish(Database.BatchableContext BC){
        system.debug('from finish method');
    }
}