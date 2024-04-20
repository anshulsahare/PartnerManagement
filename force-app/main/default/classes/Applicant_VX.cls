public with  sharing class Applicant_VX {

     public list<Applicant__c> alist {get; set;}
    public Applicant_VX(ApexPages.StandardController controller) {
   
     alist=ApplicantProvider.getapplicantrecord();
     system.debug('total record found='+alist);
    }

}