trigger Account49story1 on Account (before update) {
    Map<Id,Account> accMap = new Map<Id,Account>();
    
    for(Account objAcc : trigger.new){
        if(objAcc.Type != trigger.oldMap.get(objAcc.Id).Type){
            accMap.put(objAcc.Id, objAcc);
        }
    }
    
    List<Opportunity> oppList = new List<Opportunity>();
    if(!accMap.isEmpty()){
        for(Opportunity objOpp : [select Id, Amount,AccountId, Name from Opportunity where AccountId IN : accMap.keySet()]){
            oppList.add(objOpp);
        }
    }
    
    if(!oppList.isEmpty()){
            for(Opportunity objOpp : oppList){
                if(accMap.containsKey(objOpp.AccountId)){
                    if(accMap.get(objOpp.AccountId).Type == 'Prospect' && objOpp.Amount < 10000){
                  accMap.get(objOpp.AccountId).Description = objOpp.Name;
                    }
                }
            }
}

}