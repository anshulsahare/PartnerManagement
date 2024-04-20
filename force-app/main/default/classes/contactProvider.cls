public with sharing class contactProvider {

    @AuraEnabled
    public static void createNewContact(string ConFirstName, string conLastName, string Conphone, string conEmail){
        Contact objcon = new Contact(FirstName=ConFirstName, LastName=conLastName, Phone=Conphone, Email=conEmail);
        insert objcon;

    }

    @AuraEnabled(cacheable=true)
    public static list<Contact> getConList(string accId){
        try {
            Return [select Id,FirstName,LastName,AccountId From Contact where AccountId  =: accId];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}