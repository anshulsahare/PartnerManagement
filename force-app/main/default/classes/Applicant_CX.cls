public class Applicant_CX {
      
    public list<Applicant__c> alist {get; set;}
    public Applicant_CX(ApexPages.StandardController controller) {
     
     alist=[select Name,First_Name__c,Last_Name__c,Gender__c,DOB__c,CreatedDate from Applicant__c where CreatedDate>=2022-04-01T00:00:00Z and CreatedDate<=2022-06-21T00:00:00z];
     
    
    }

}