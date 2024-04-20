global class BatchAccountToOpportunity implements Database.Batchable<sObject>{

    global Database.QueryLocator start(database.BatchableContext BC){
  return  Database.getQueryLocator('select Id,Name,Rating from Account');
  }
  
  global void execute(database.BatchableContext BC, list<Account> acclist){
  Map<Id,Account> Accmap = new Map<Id,Account>();
		  if(!acclist.isEmpty()){
		  for(Account objacc :acclist){
			 Accmap.put(objacc.Id, objacc);
		   }
		  }
  list<Opportunity> opplist = new list<Opportunity>();
		  if(!Accmap.isEmpty()){
			 for(Opportunity objopp : [select Id,Name,DeliveryInstallationStatus__c,AccountId from Opportunity where AccountId IN : Accmap.Keyset()]){
				  opplist.add(objopp);
			   }
			 }
  if(!opplist.isEmpty()){
		  for(Opportunity objopp : opplist){
		  if(Accmap.containskey(objopp.AccountId)){
		   if(Accmap.get(objopp.AccountId).Rating=='Hot'){
				 objopp.DeliveryInstallationStatus__c='Completed' ;
		   }
		   else{
				if(Accmap.get(objopp.AccountId).Rating=='Cold' || Accmap.get(objopp.AccountId).Rating=='Warm'){
						 objopp.DeliveryInstallationStatus__c='In Progress' ;
				}
				else{
						 objopp.DeliveryInstallationStatus__c='';
				 }
		   
				}
			   }
			}
			database.update(opplist,false);
		  }
    }
  
  
  global void finish(database.BatchableContext BC){
  
  }
}