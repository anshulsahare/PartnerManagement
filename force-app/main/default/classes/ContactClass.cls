public with sharing class ContactClass {

    public Contact objc{get; set;}
    public ContactClass(ApexPages.StandardController controller) {
    Id apid=apexpages.currentpage().getparameters().get('Id');
    system.debug('id is='+apid);
    objc=[select Id, FirstName, LastName,Name,MobilePhone from Contact where Id= : apid ];
    }

    @AuraEnabled(cacheable=true)
    public static list<Contact> getConlist(string keySearch){
       list<Contact> conlist =  [ Select Id, FirstName, LastName, Email, Phone, Account.Name From Contact Where Account.Name=:keySearch ]; 
       return conlist;
    }
}