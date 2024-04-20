trigger practiLect48stor1 on Account (after update) {
   Map<Id,Account> accMap = new Map<Id,Account>();
    for(Account objAcc : trigger.new){        
        if(!String.isBlank(objAcc.Type) && (objAcc.Type != trigger.oldMap.get(objAcc.Id).Type) ){
            accMap.put(objAcc.Id, objAcc);
        }
    }
    List<Contact> conList = new List<Contact>();
     if(!accMap.isEmpty()){
        for(Contact objCon : [select Id,LeadSource,Level__c,AccountId from Contact where AccountId IN : accMap.keySet() ]){
            conList.add(objCon);
        }
    }
  if(!conList.isEmpty()){
        for(Contact objCon : conList){
            if(accMap.containsKey(objCon.AccountId)){
                if(accMap.get(objCon.AccountId).Type == 'Technology Partner'){
                    objCon.LeadSource = 'Web';
                    objCon.Level__c = 'Primary';
                }
                else{
                    objCon.LeadSource = '';
                    objCon.Level__c = '';
                }
            }
        }
        Database.update(conList, false);
    }
  }