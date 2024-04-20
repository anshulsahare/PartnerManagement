public with sharing class AccountCreteRecordProvider {
    @AuraEnabled
    public static void createNewAccount(Account objAcc){ //Name, Type
        if(objAcc !=null)
                    insert objAcc;
        
    }

}