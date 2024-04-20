public with sharing class AddressClass {

    public Address__c objadd {get; set;}
    public AddressClass(ApexPages.StandardController controller) {
    string ApplicantName=Apexpages.currentpage().getparameters().get('ApplicantName');
    string Country=Apexpages.currentpage().getparameters().get('Country');
     objadd=[ select Id, Name, Applicant_Full_Name__c,Country__c,State__c,City__c from Address__c where Applicant_Full_Name__c=: ApplicantName and Country__c=: Country];
    }

}