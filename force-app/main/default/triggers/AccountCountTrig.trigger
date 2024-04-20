trigger AccountCountTrig on Account (after insert, after update) {
   
    Map<Id,Account> accMap = new Map<Id,Account>();
    for(Account objacc : trigger.new){
        if(trigger.isInsert && trigger.isAfter){
            accMap.put(objacc.Id, objacc);
        }
     if(trigger.isUpdate && trigger.isAfter){
         if(objacc.Number_of_contacts__c != trigger.oldMap.get(objacc.Id).Number_of_contacts__c){
             accMap.put(objacc.Id, objacc);
         }
        }               
    }
    
    list<Contact> conlist = new list<Contact>();
    for(Account objacc :[select Id,Name,Number_of_contacts__c from Account where Id IN : accMap.keySet()]){
        for(integer i=1; i<=objacc.Number_of_contacts__c; i++){
            Contact objcon = new Contact();
            objcon.FirstName=objacc.Name;
            objcon.LastName=objacc.Name;
            objcon.AccountId=objacc.Id;
            conlist.add(objcon);
        }
    }
    
    if(!conlist.isEmpty()){
        database.insert(conlist, false);
    }
}