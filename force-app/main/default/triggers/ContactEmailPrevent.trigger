trigger ContactEmailPrevent on Contact (before insert, before update,after undelete) {
  
    for(Contact objcon :trigger.new){
        if((trigger.isBefore && trigger.isInsert) || (trigger.isAfter && trigger.isundelete) || (trigger.isBefore && trigger.Isupdate)){
            if(string.isBlank(objcon.Email)){
               objcon.Email.adderror('trigger email prevent');
            }
        }
    }
    
}