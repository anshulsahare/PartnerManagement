public class Account51story1Helper {
    
    public static void AccoutDeletePrevent(list<Account> accoldlist){
        for(Account obja : accoldlist){
            if(obja.SLA__c=='Gold'){
                obja.adderror('you can not be deleted this type of record');
            }
        }
    }
    

    public static void AccoutUpdateRecord(List<Account> accNewlist){
        
        for(Account objacc :accNewlist){
            if(!string.isBlank(objacc.Type)){
           if(objacc.Type=='Prospect'){
                    objacc.Rating='Hot';
                }
            }
         }
    }
  }