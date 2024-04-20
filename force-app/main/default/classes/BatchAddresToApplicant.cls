global class BatchAddresToApplicant implements Database.Batchable<sObject>{
    
   global Database.QueryLocator start(Database.BatchableContext BC){
  return database.getQueryLocator('select Id,Name,City__c,Pin_Code__c,Applicant__r.Id,Applicant__r.Name,Applicant__r.Police_verification__c from Address__c where City__c=\'Nagpur\' and Pin_Code__c like \'44%\' and Applicant__r.Police_verification__c=true');
  }
    
  global void execute(Database.BatchableContext BC, list<Address__c> Addrlist){
    set<Id> appidset = new set<id>();
			if(!Addrlist.isEmpty()){
			for(Address__c objadr : Addrlist ){
			if(objadr.Applicant__c !=null){
			  appidset.add(objadr.Applicant__c);
			}
		  }
		}
		  
    Map<Id, Applicant__c> Appmap = new Map<Id, Applicant__c>();
			if(!appidset.isEmpty()){
			for(Applicant__c objapp : [select Id,Name,Police_verification__c, List_Of_Address__c from Applicant__c where Id IN : appidset]){
				Appmap.put(objapp.Id, objapp);
			 }
			}
	if(!Appmap.IsEmpty()){
			   for(Address__c objadr : Addrlist){
			   if(Appmap.Containskey(objadr.Applicant__c)){
			   if(string.isBlank(Appmap.get(objadr.Applicant__c).List_Of_Address__c)){
			       Appmap.get(objadr.Applicant__c).List_Of_Address__c=objadr.Name+' '+objadr.City__c+' '+objadr.Pin_Code__c ;
			   }
			   else{
			       Appmap.get(objadr.Applicant__c).List_Of_Address__c=Appmap.get(objadr.Applicant__c).List_Of_Address__c+'\n'+objadr.Name+' '+objadr.City__c+' '+objadr.Pin_Code__c ;
			   }
	       }
	   }
        Database.update(Appmap.values(), false);
	}		
	
  }
    global void finish(Database.BatchableContext BC){
  
   }
 }