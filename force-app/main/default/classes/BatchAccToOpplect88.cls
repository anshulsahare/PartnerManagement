global class BatchAccToOpplect88 implements database.Batchable<sObject> {

    global database.QueryLocator start(database.BatchableContext BC){
    string objsrt = 'select Id,Name,Rating from Account';
    return database.getQueryLocator(objsrt);
    }
    global void execute(database.BatchableContext BC, list<Account> acclist){
        Map<Id,Account> accMap = new  Map<Id,Account>();
        list<Opportunity> opplist = new list<Opportunity>();
        for(Opportunity objopp : [select Id,Name,DeliveryInstallationStatus__c ,AccountId from Opportunity where AccountId IN : accMap.keySet()]){
            opplist.add(objopp);
        }
        if(!accMap.isEmpty()){
            for(Opportunity objopp : opplist){
                if(accMap.containskey(objopp.AccountId)){
                    if(accMap.get(objopp.AccountId).Rating=='Hot'){
                        objopp.DeliveryInstallationStatus__c='Completed';
                    }
                    else{
                        if((accMap.get(objopp.AccountId).Rating=='Cold') || (accMap.get(objopp.AccountId).Rating=='Warm')){
                            objopp.DeliveryInstallationStatus__c='In - Progress';
                        }
                        else{ 
                            objopp.DeliveryInstallationStatus__c='Yet to begin';
                        }                                                     
                    }
                }
            }
            Database.update(opplist,false);
        }
    }
    global void finish(database.BatchableContext BC){
        
    }
 }