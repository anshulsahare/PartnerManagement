@isTest
public class AccTriggerrTestMixedDmlcls {

    @istest
    public static void Mytestmethod(){
        Account objacc = new Account(Name='ABC Mall', Rating='Hot');
        insert objacc;   //non-setup object
        
        profile p = [select Id from profile where Name='Agent'];
        userRole r = [select Id from  userRole where Name='CEO'];
        
        User userObj = new User(LastName = 'testUser',
        FirstName='test',
        Alias = 'test',
        Email = 'UserTest@abc.com',
        Username = 'UserTest@abc.com',
        ProfileId = p.id,
        TimeZoneSidKey = 'GMT',
        LanguageLocaleKey = 'en_US',
        EmailEncodingKey = 'UTF-8',
        LocaleSidKey = 'en_US'
        );
        
        insert userObj ;
    }
}