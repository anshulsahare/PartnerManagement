public class TestConHandlerClass {

    public static void getConRecord(list<Contact> conlist){
        
        set<Id> accId = new set<Id>();
        system.debug('accId = '+accId);
        for(Contact objcon : conlist ){
            if(objcon.AccountID != null){
                accId.add(objcon.AccountID);
            }
        }
        
        Map<Id,Account> accMap = new Map<Id,Account>();
        system.debug('accMap = '+accMap);
        for(Account objacc : [select Id,Name,Count_Of_Contacts__c,(select Id from contacts) from Account where ID IN :accId ]){
            accMap.put(objacc.Id, objacc);
        }
        
        for(Contact objcon : conlist){
            if(accMap.containsKey(objcon.AccountId)){
                accMap.get(objcon.AccountId).Count_Of_Contacts__c = accMap.get(objcon.AccountId).Contacts.size();
            }
        }
        update accMap.values();
    }      
}