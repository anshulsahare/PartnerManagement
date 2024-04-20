public class ConRelationClass {

    list<Contact_Relationship__c> listcon = new list<Contact_Relationship__c>();
    
    public void GetConMethod(list<contact> conlist){
        for(contact objcon : conlist){
            if(objcon.Contact_Relationship__c==true){
                Contact_Relationship__c objh = new Contact_Relationship__c();
                  objh.Con_Name__c=objcon.FirstName;
                  objh.Con_ID__c=objcon.Id;
                listcon.add(objh);
            }
        }
        insert listcon;
    }
}