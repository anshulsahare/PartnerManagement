global class Batch1AppliMaleUpdate implements Database.Batchable<sObject> {

    global Database.QueryLocator start(Database.BatchableContext BC){
     return Database.getQueryLocator('select Id,Gender__c,True_Verification__c from Applicant__c where Gender__c=\'Male\' and True_Verification__c !=true');
		}
	global void execute(Database.BatchableContext BC, list <Applicant__c> applist){
        if(!applist.isEmpty()){
		for(Applicant__c objapp : applist){
		if(string.isNotBlank(objapp.Gender__c)){
		    objapp.True_Verification__c=true;
		  }
		}
		Database.Update(applist, false);
	 }
  }
	global void finish(Database.BatchableContext BC){
     Database.executeBatch(new Batch2AddresCityPuneUpdt());
	}
}