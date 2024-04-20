global class BatchContactToAccount implements Database.Batchable<sObject> {

    global database.QueryLocator start(Database.BatchableContext BC){
    return database.getQueryLocator('select Id,FirstName, LastName, LeadSource, Account.Id, Account.Name, Account.Description from Contact where LeadSource=\'Web\' ');   
    }
    Global void execute(Database.BatchableContext BC, list<Contact> contactlist){
        set<Id> Accidset = new set<Id>();
                if(!contactlist.isEmpty()){
                for(Contact objcon : contactlist){
                    if(objcon.AccountId !=null){
                        Accidset.add(objcon.AccountId);
                    }
                  }
                }
        Map<Id,Account> Accmap= new Map<Id,Account>();
                if(!Accidset.isEmpty()){
                    for(Account objacc : [select Id, Name, Description from Account where Id IN : Accidset]){
                        accmap.put(objacc.Id, objacc);
                    }
                }
                    
              if(!Accmap.isEmpty()){
               for(Contact objcon : contactlist){
                   if(Accmap.containskey(objcon.AccountId)){
                       if(string.isBlank(Accmap.get(objcon.AccountId).Description)){
                           Accmap.get(objcon.AccountId).Description=objcon.FirstName+' '+objcon.LastName+' '+objcon.LeadSource ;
                        }
                       else{
                           Accmap.get(objcon.AccountId).Description=Accmap.get(objcon.AccountId).Description+'\n '+objcon.FirstName+' '+objcon.LastName+' '+objcon.LeadSource;
                        }
                      }
                    }
                  Database.update(Accmap.values(), false);
                  }
            }
    global void finish(Database.BatchableContext BC){
        
    }
}