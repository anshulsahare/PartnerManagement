public class AccountHandler {
   
    public static Account insertNewAccount (String AccountName){
       try {
                Account newacct = new Account (Name=AccountName);
                  insert newacct;
                 return newacct;
                
            } catch (DmlException e) {
               System.debug('A DML exception has occurred:'+
                            e.getMessage());
                 return null;
            }
    }
}