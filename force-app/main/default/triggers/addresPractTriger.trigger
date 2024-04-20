trigger addresPractTriger on Address__c (after insert, after update) {
    
    set<Id> AppliIDSet = new set<Id>();
    for(Address__c objadr : trigger.new){
        AppliIDSet.add(objadr.Applicant__c);
    }
    
    Map<Id, Applicant__c> AppMap = new Map<Id, Applicant__c>();
    for(Applicant__c objapp : [select Id, True_Verification__c from Applicant__c where Id IN : AppliIDSet] ){
        AppMap.put(objapp.Id, objapp);
    }
    
    
    for(Address__c objadr : trigger.new){
        if(AppMap.containskey(objadr.Applicant__c)){
            if(objadr.Country__c=='India' && objadr.State__c=='Maharashtra' && objadr.City__c=='Nagpur'){
                AppMap.get(objadr.Applicant__c).True_Verification__c=True;
            }
        }
        else{
            objadr.Country__c='';
            objadr.State__c='';
            objadr.City__c='';
        }
    }
    
    if(!AppMap.IsEmpty()){
        database.update(AppMap.values(), false);
    }
}