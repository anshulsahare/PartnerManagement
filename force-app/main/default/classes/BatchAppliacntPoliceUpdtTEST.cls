@isTest
public class BatchAppliacntPoliceUpdtTEST {

    @testSetup
    public static void setup(){
        list<Applicant__c> applist = new list<Applicant__c>();
        for(integer i=1; i<200; i++){
            Applicant__c objapp = new Applicant__c(First_Name__c='Rawan', Gender__c='Male', Phone_Number__c='123456789');
            applist.add(objapp); 
        }
        if(!applist.isEmpty()){
            database.insert(applist, false);
        }
    }
    @isTest
    public static void testbatchappUpdate(){
        test.startTest();
             database.executeBatch(new BatchAppliacntPoliceUpdt(), 200);
        test.stopTest();
        
        list<Applicant__c> actualAPPlist = [select Id,First_Name__c,Gender__c,Phone_Number__c, True_Verification__c from Applicant__c ];
        for(Applicant__c actualobjAPP : actualAPPlist ){
            system.assertEquals(true, actualobjAPP.True_Verification__c);
        }
    }
}