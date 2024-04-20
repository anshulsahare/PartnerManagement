public with sharing class AccountProviderClass{
    
    @AuraEnabled
    public static void AccountProviderClassMethod(Account objacc) {
     insert objacc;
    }
}