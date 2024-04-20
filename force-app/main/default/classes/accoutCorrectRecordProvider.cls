public with sharing class accoutCorrectRecordProvider {

    @AuraEnabled
    public static string accoutNewCorrectRecordProvider(string accid){
       
    return [select Type from Account where Id =: accid LIMIT 1].Type;

    }
}