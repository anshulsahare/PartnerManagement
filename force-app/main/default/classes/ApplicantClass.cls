public class ApplicantClass {

    public list<Applicant__c> alist {get; set;}
    public ApplicantClass(ApexPages.StandardController controller) {
     
      alist= [select Name,First_Name__c,Last_Name__c,Age__c from Applicant__c lIMIT 5];
      system.debug('aplicant size'+alist.size());
    }

}