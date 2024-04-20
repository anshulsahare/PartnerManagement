global class BatchClsContact implements Database.Batchable<sObject>{
 
    global database.QueryLocator start(Database.BatchableContext BC){
    string strvar= 'select Name, LeadSource,Level__c from Contact ';
    return database.getQueryLocator(strvar);   
    }
    global void execute(Database.BatchableContext BC, list<Contact > conlist){
        for(Contact objcon : conlist){
            if(objcon.LeadSource=='Web'){
                objcon.Level__c='Primary';
            }
            else{
                if(objcon.LeadSource=='Phone Inquiry' || objcon.LeadSource=='Partner Referral'){
                    objcon.Level__c='Tertiary';
                }
                else{
                    objcon.Level__c='';
                }
            }
        }
        Database.update(conlist, false);
        system.debug('all done');
    }
    global void finish(Database.BatchableContext BC){
        
    }
}