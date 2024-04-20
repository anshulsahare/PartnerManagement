global class BatchAppliacntPoliceUpdt implements database.Batchable<sObject> {

   global Database.QueryLocator start(database.BatchableContext BC){
   string Appstring = 'select Id,First_Name__c,Gender__c,True_Verification__c from Applicant__c where True_Verification__c!=true and Gender__c=\'Male\'';
       return database.getQueryLocator(Appstring);
    }
    global void execute(database.BatchableContext BC, list<Applicant__c> applist){
        if(!applist.isEmpty()){
            for(Applicant__c objapp : applist){
                if(string.isNotBlank(objapp.Gender__c)){
                    objapp.True_Verification__c=true;
                }
            }
            database.update(applist, false);
        }
    
    }
    global void finish(database.BatchableContext BC){
        
    }
}