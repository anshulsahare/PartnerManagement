trigger Scenario12Customer on Customer__c (before delete) {
    
    set<id> setCustID = new set<id>();
    for(Customer__c objCust : trigger.old)
        setCustID.add(objCust.id);
    List<CustomerHistory__c> lstCustHis = new List<CustomerHistory__c>([select Customer__c from CustomerHistory__c where Customer__c in :setCustID]);
    if(!lstCustHis.isEmpty())
        Database.delete(lstCustHis, false);
}