@isTest
public class AccountTriggerForTestCLASS {
   
    @isTest
    public static void AccountTriggerMetod(){
        Account objacc = new Account(Name='Ram', Rating='Hot');
        insert objacc; //Code Covergare
        
        string ActualType = [select Id,Name,Rating,Type from Account where Id=:objacc.Id].Type;
        system.assertEquals('Prospect', ActualType);
    }
    //BUSINESS LOGIC
    @isTest
    public static void AccountTriggerMetodUpdate(){
        Account objacc = new Account(Name='Ram', Rating='Warm');
        insert objacc; //Code Covergare
        
        string ActualType = [select Id,Name,Rating,Type from Account where Id=:objacc.Id].Type;
        system.assertEquals(null, ActualType);
    }
     @isTest
    public static void AccountTriggerMetodUpdatetwo(){
        Account objacc = new Account(Name='Ram' );
        insert objacc; //Code Covergare
        
        string ActualType = [select Id,Name,Rating,Type from Account where Id=:objacc.Id].Type;
        system.assertEquals(null, ActualType);
    }
}