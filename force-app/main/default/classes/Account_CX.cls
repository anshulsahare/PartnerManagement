public class Account_CX {
     
     public list<Account> acclist {get; set;}
     public Account_Cx(apexpages.standardcontroller controller){
     acclist =[select id,Name,Type,Rating,CreatedDate from Account where CreatedDate>=2022-04-19T00:00:00Z And CreatedDate<=2022-07-10T00:00:00Z];  

     }


     @AuraEnabled
     public static List<Account> getaccountlist(){
          return [Select Id,Name,Phone,(Select Id, FirstName, Lastname, AccountId, Phone From Contacts) From Account ];
     }
     

}