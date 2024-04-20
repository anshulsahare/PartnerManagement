@isTest 
public class CotactAccTriggTestClass {
    
    @isTest
    public static void ContactinsertMethod(){
        Account objacc = new Account(Name='Ram');
        insert objacc;
        
        contact objcon = new contact(FirstName='bro', LastName='Shet', AccountId=objacc.id);
        insert objcon; //Code Coverage
            
    }
}