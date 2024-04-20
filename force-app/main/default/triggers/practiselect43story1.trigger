trigger practiselect43story1 on Applicant__c (after delete) {
    
    list<Address__c> adrlist = new list <Address__c>();
    for( Applicant__c objapp : trigger.old){
        
        Address__c objadr = new Address__c();
        objadr.Address_line_1__c=objapp.First_Name__c;
        objadr.Address_line_1__c=objapp.Last_Name__c; 
        objadr.Addres_line_2__c= objapp.Gender__c;
        adrlist.add(objadr);
    }
    if(!adrlist.isEmpty())
        database.insert(adrlist,false);
}