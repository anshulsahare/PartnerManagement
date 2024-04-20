trigger Applicant48story2 on Applicant__c (after update) {
    map<Id,Applicant__c> appmap = new map<Id, Applicant__c>();
    for(Applicant__c objapp :trigger.new){
        if(objapp.Police_verification__c != trigger.oldmap.get(Objapp.Id).Police_verification__c && objapp.Gender__c != trigger.oldmap.get(objapp.Id).Gender__c){
           appmap.put(objapp.Id, objapp);
        }
    } 
    list<Address__c> addlist = new list<Address__c>();
    for(Address__c objadd : [select City__c,Pin_Code__c,Applicant__c from Address__c where Applicant__c IN : appmap.Keyset()]){
        addlist.add(objadd);
    }
    
    for(Address__c objadd : addlist){
        if(appmap.containskey(objadd.Applicant__c)){
            if(appmap.get(objadd.Applicant__c).Police_verification__c && appmap.get(objadd.Applicant__c).Gender__c=='Male'){
                if(objadd.Pin_Code__c.startsWith('44')){
                    objadd.Country__c='India';
                    objadd.State__c='Maharashtra';
                    objadd.City__c='Nagpur';
                }
                else{
                    objadd.Country__c='';
                    objadd.State__c='';
                    objadd.City__c='';
                }
            }
        }
    }
    database.update(addlist,false);
}