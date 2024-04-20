public without sharing class ApplicantProvider {
   
    @AuraEnabled
    public static void insertapplicantrecord(Applicant__c objapins){
        if(objapins !=null){
            insert objapins;
        }
}

 @AuraEnabled
public static Applicant__c getAppliNameRecord(Applicant__c objapp){
    Applicant__c objAppRetrived = [select Id,Email_Id__c ,First_Name__c,Pan_Card__c, Phone_Number__c,Last_Name__c, Gender__c, DOB__c from Applicant__c where First_Name__c  =: objapp.Id ];
    return objAppRetrived;
   }

   @AuraEnabled
   public static Applicant__c updateApplicantRecord(Applicant__c objapins){
           update objapins;
           return [select Id,Email_Id__c ,First_Name__c,Pan_Card__c, Phone_Number__c,Last_Name__c, Gender__c, DOB__c from Applicant__c where First_Name__c  =: objapins.First_Name__c  ];
       }

       
   @AuraEnabled
   public static list<Applicant__c> genderApplicantRecord(Applicant__c genderobj){
           return [select Id,Email_Id__c ,First_Name__c,Pan_Card__c, Phone_Number__c,Last_Name__c, Gender__c, DOB__c from Applicant__c where Gender__c  =: genderobj.Gender__c  ];
       }

       @AuraEnabled
   public static list<Applicant__c> dateApplicantRecord(Date fromDateobj, Date todayDateObj){
           return [select Id,Email_Id__c ,First_Name__c,Pan_Card__c, Phone_Number__c,Last_Name__c, Gender__c, DOB__c from Applicant__c where DOB__c >=: fromDateobj and DOB__c <=: todayDateObj  ];
       }

       @AuraEnabled
   public static list<Applicant__c> firstNameApplicantRecord(Applicant__c objapp){
           return [select Id,Email_Id__c ,First_Name__c,Pan_Card__c, Phone_Number__c,Last_Name__c, Gender__c, DOB__c from Applicant__c where First_Name__c like : objapp.First_Name__c+'%'];
        
       }

       @AuraEnabled
       public static list<Applicant__c> deleteNameApplicantRecord(list<Id> appliId, Applicant__c objapp){
        delete [select Id from Applicant__c where Id IN : appliId];
               return [select Id,Email_Id__c ,First_Name__c,Pan_Card__c, Phone_Number__c,Last_Name__c, Gender__c, DOB__c from Applicant__c where First_Name__c like : objapp.First_Name__c+'%'];
    
}

@AuraEnabled(cacheable=true)
public static list<Account> accListGetMethod(){
try {
    list<Account> acclist = [select Id,Name ,Rating,Type from Account LIMIT 100];
    return acclist;
} catch (Exception e) {
    throw new AuraHandledException(e.getMessage());
}
}
}