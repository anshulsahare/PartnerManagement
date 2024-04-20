trigger Account51story1 on Account (before insert, before update, before delete) {
   
    if(trigger.IsBefore && trigger.IsInsert){
    Account51story1Handler.beforeinsert(trigger.new); //list<Account>
        
    }
    if(trigger.IsBefore && trigger.IsUpdate){
    Account51story1Handler.beforeupdate(trigger.new);    //list<Account>
        
    }
    if(trigger.IsBefore && trigger.IsDelete){
       Account51story1Handler.afterdelete(trigger.old);  //list<Account>
    }
    
      
        
}