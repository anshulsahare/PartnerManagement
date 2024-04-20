trigger EMailPrevConTrigger on Contact (before insert, before update, after undelete) {

    set<string> conEmailset = new set<string>();
  for(Contact objcon : trigger.new){
    if(string.isNotBlank(objcon.Email)){
       conEmailset.add(objcon.Email);
    }
  }
  
  list<Contact> conlist = [select Id, Email from contact where Email IN : conEmailset];
  
 Map<string,contact> conMap = new Map<string,contact>();
    for(Contact objcon : conlist){
        conMap.put(objcon.Id, objcon);
    }
    
    for(Contact objcon : trigger.new){
        if(conMap.containskey(objcon.Email)){
            objcon.Email.addError('Same name of EMAIL already exist in contact');
        }
    }
    
}