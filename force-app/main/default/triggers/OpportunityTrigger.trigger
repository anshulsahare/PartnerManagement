trigger OpportunityTrigger on Opportunity (after delete) {
list<Opportunity_Backup__c> oplist = new list<Opportunity_Backup__c>();
    for(Opportunity objopp : trigger.old){
        
        if(objopp.StageName=='Prospecting'){
            objopp.StageName.adderror('this record can not be deleted as stagename is prospecting');
          }
        else{
            Opportunity_Backup__c objbk = new Opportunity_Backup__c();
            objbk.Opportunity_name__c=objopp.Name;
            objbk.Ammount__c=objopp.Amount;
            insert objbk;
        }
    }

}