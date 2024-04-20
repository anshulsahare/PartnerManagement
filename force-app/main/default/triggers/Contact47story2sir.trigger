trigger Contact47story2sir on Contact (before insert) {

    Set<Id> accIdSet = new Set<Id>();
    for(Contact objCon : trigger.new){
        if(objCon.AccountId !=null){
            
            if(trigger.isInsert && trigger.isBefore){
                accIdSet.add(objCon.AccountId);
            }
            
            if(trigger.isUpdate && trigger.isBefore){
                if(objCon.AccountId != trigger.oldMap.get(objCon.Id).AccountId){
                    accIdSet.add(objCon.AccountId);
                }
            }
        }
    }
    
    Map<Id,Account> accMap = new Map<Id,Account>();
    if(!accIdSet.isEmpty()){
            for(Account objAcc : [select Id,Rating from Account where Id IN : accIdSet]){
                accMap.put(objAcc.Id, objAcc);
            }
    }
    
    if(!accMap.isEmpty()){
            for(Contact objCon : trigger.new){
                if(accMap.containsKey(objCon.AccountId)){
                    
                    if(String.isNotBlank(accMap.get(objCon.AccountId).Rating)){  
                                if(accMap.get(objCon.AccountId).Rating == 'Hot'){
                                    objCon.Level__c = 'Primary';
                                }
                                else{
                                    if(accMap.get(objCon.AccountId).Rating == 'Cold'){
                                         objCon.Level__c = 'Secondary';
                                    }
                                    else{
                                         objCon.Level__c = 'Tertiary';
                                    }
                                }
                            }
                    else{
                        objCon.Level__c = '';
                    }
                    
                }
            }
    }
    
}