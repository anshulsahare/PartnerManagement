trigger AccountTruPrac on Account ( after update) {
    Map<id,Account> accmap = new Map<id,Account>();
    for(Account objacc : trigger.new){
        if(objacc.Type != trigger.oldmap.get(objacc.id).type){
            accmap.put(objacc.id, objacc);
        }
    }
    list<Contact> conlist = new list<Contact>();
    if(!accmap.isEmpty()){
        for(Contact objcon : [select Id,FirstName, LastName, LeadSource, AccountId from Contact where AccountId IN : accmap.keySet()]){
            conlist.add(objcon);
        }
    }
    
    if(!conlist.isEmpty()){
        for(contact objcon : conlist){
            if(accmap.containsKey(objcon.AccountId)){
                if(accmap.get(objcon.AccountId).Type=='Technology Partner'){
                objcon.LeadSource='Web';
            }
            else{
                objcon.LeadSource='';
            }
          }
        }
        database.update(conlist, false);
    }
   
}