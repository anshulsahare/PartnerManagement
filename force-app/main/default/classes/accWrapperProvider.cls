public with sharing class accWrapperProvider {
    
    @AuraEnabled(Cacheable = true)
    public static List<WrapperDemo> fetchAccAndCons() {
        List<WrapperDemo> lstWrapper = new List<WrapperDemo>();

        for(Account acIterator : [ SELECT Id, Name, (Select Id, Name From Contacts) FROM Account] ) {
            lstWrapper.add(new WrapperDemo(acIterator, acIterator.Contacts));
        }

        return lstWrapper;
        
    }
 
 // Wrapper Class
 public class WrapperDemo {
        @AuraEnabled public Account objAcc;
        @AuraEnabled public list<Contact> lstCons;

        public WrapperDemo(Account acc, list<Contact> conlist) {
            this.objAcc = acc;
            this.lstCons = conlist;
        }
    }
}