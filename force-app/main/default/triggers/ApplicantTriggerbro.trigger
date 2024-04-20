trigger ApplicantTriggerbro on Applicant__c (after update) {
  Map<id, Applicant__c> appmap = new  Map<Id, Applicant__c>();
   for(Applicant__c objapp : trigger.new){
   if((objapp.Police_verification__c != trigger.oldmap.get(objapp.Id).Police_verification__c) && (objapp.Gender__c != trigger.oldmap.get(objapp.Id).Gender__c)){
     appmap.put(objapp.Id, objapp);
     }
   }
   list<Address__c> addlist = new list<Address__c>();
   for(Address__c objadr : [select Id,Country__c,State__c,City__c , Applicant__c from Address__c where Applicant__c IN : appmap.keyset()]){
      addlist.add(objadr);
   }
   if(!addlist.isEmpty()){
   for(Address__c objadr : addlist){
   if(appmap.containskey(objadr.Applicant__c)){
       if((appmap.get(objadr.Applicant__c).Police_verification__c) && (appmap.get(objadr.Applicant__c).Gender__c=='Male')){
        objadr.Country__c='India';
        objadr.State__c='Maharashtra';
        objadr.City__c='Nagpur';
      }
      else{
           objadr.Country__c='';
           objadr.State__c='';
           objadr.City__c='';
       }
      }
     }
       database.update(addlist, false);
   }
}