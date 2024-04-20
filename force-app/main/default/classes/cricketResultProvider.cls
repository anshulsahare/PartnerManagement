public with sharing class cricketResultProvider {
    
    @AuraEnabled(cacheable=true)
    public static list<Cricket__c> cricketResultProviderMethod(String nationalPicApex){
        system.debug('nationalPicApex='+nationalPicApex);
        if (String.isBlank(nationalPicApex)) {
            return [SELECT Id, Cricketer_Name__c, Images__c, Image_url__c, Nationality__c, Run__c FROM Cricket__c];
        } else {
            return [SELECT Id, Cricketer_Name__c, Images__c, Image_url__c, Nationality__c, Run__c FROM Cricket__c WHERE Nationality__c = :nationalPicApex];
        }
    }

    @AuraEnabled(cacheable=true)
     public static Cricket__c  updateCricket(Cricket__c objacc){
      try {
         update objacc;
         return objacc;
      } catch (Exception e) {
         throw new AuraHandledException(e.getMessage());
      } 
    }
}