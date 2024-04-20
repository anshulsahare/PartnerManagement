trigger lect49triSt1 on Account (after update) {

 Map<Id,Account> accMap = new Map<Id,Account>();
  for(Account objacc : trigger.old){
  if(objacc.Type != trigger.oldmap.get(objacc.id).Type){
      accMap.put(objacc.Id, objacc);
   }
  }
  
  list<Opportunity > opplist = new list<Opportunity >();
  if(!accMap.isEmpty()){
  for(Opportunity  objopp : [select Name,Type,Amount,AccountId from Opportunity  where AccountId IN : accMap.keySet()]){
    opplist.add(objopp);
    }
  }
  
  for(Opportunity objopp : opplist){
    if(accMap.containskey(objopp.AccountId)){
        if(string.isBlank(accMap.get(objopp.AccountId).Type)){
    if((accMap.get(objopp.AccountId).Type=='Prospect') && (objopp.Amount<=10000)){
       accMap.get(objopp.AccountId).Description=objopp.Name;
         }
        }
     else{
       accMap.get(objopp.AccountId).Description=accMap.get(objopp.AccountId).Description+'\n'+objopp.Name;
      }
    }
  }

}