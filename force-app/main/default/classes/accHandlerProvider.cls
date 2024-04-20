public class accHandlerProvider {
    
    public static void beforeInsertMethod(list<Account> accList){
        for(Account acc : accList){
            acc.Description='Account is Created/ Updated';
        }
    }
    public static void afterInsertMethod(list<Account> accList){
        list<Opportunity> opplist = new list<Opportunity>();
        for(Account acc : accList){
            Opportunity objopp = new Opportunity();
            objopp.Name=acc.Name;
            objopp.Amount=acc.Total_Ammount_1__c;
            objopp.AccountId=acc.Id;
            objopp.CloseDate=system.today();
            objopp.StageName='closed lost';
            opplist.add(objopp);
        }
        insert opplist;
    }
    
    public static void beforeUpdateOpprtunity(list<Account> acclist, Map<Id,Account> accOldMap){
        for(Account objacc : acclist){
            if( (accOldMap != null ) && (objacc.Phone != accOldMap.get(objacc.Id).Phone)  ){
                objacc.Description = 'Phone number updated Succesfully'+'\n'+'old number'+accOldMap.get(objacc.Id).Phone+' \n'+'new updated Number'+objacc.Phone;
                system.debug('list dekhte hh'+acclist);
                system.debug('Map dekhte hh'+accOldMap);
            }
            
        }
    }
    
    public static void afterUpdateOpprtunity(list<Account> acclist, Map<Id,Account> accOldMap){
        Map<Id,Account> accMap = new Map<Id,Account>();
        for(Account objacc : acclist){
            if( (accOldMap != null ) && (objacc.Total_Ammount_1__c != accOldMap.get(objacc.Id).Total_Ammount_1__c)  ){
                accMap.put(objacc.Id, objacc);
            }
            
            list<Opportunity> opplist = new list<Opportunity>();
            for(Opportunity objopp : [select Id,Name,Amount, AccountId from Opportunity where AccountId IN : accMap.keySet()] ){
                opplist.add(objopp);
            }
            
            for(Opportunity objopp : opplist){
                if(accMap.containsKey(objacc.Id)){
                    objopp.Amount=accMap.get(objacc.Id).Total_Ammount_1__c;
                }
            }
            database.update(opplist, false);
        }
    }
}