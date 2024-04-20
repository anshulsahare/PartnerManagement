public class Account51story1Handler {
    
    public static void beforeinsert(list<Account> accNewlist){
       Account51story1Helper.AccoutUpdateRecord(accNewlist);        
    }
    public static void beforeupdate(list<Account> accNewlist){
        Account51story1Helper.AccoutUpdateRecord(accNewlist);
        
    }
    public static void afterdelete(list<Account> accoldlist){
        Account51story1Helper.AccoutDeletePrevent(accoldlist);
    }

}