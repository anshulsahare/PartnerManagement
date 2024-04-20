global class Batch2AddresCityPuneUpdt implements Database.Batchable<sObject>{

    global Database.QueryLocator start(Database.BatchableContext BC){
		return Database.getQuerylocator('select Country__c, State__c, City__c from Address__c where City__c !=\'Pune\' and Applicant__r.Gender__c=\'Male\' and Applicant__r.True_Verification__c=true');
		}
	global void execute(Database.BatchableContext BC, list<Address__c> adrlist){
		 if(!adrlist.isEmpty()){
		 for(Address__c objadr : adrlist){
		 objadr.Country__c='Shrilnaka';
		 objadr.State__c='Punjab';
		 Objadr.City__c='Pune';
		 }
		 Database.Update(adrlist, false);
		 }
		}
	global void finish(Database.BatchableContext BC ){

	}
}