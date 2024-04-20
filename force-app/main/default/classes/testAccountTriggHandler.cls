//Prevent duplicat name of Account base on the Account name
public class testAccountTriggHandler {

    
    public static void accMethod(list<Account> acclist){
        set<string> accNamestring = new set<string>();
        for(Account objacc : acclist){
            if(string.isNotBlank(objacc.Name)){
                accNamestring.add(objacc.Name);	
            }
        }
        
        list<Account> newAcclist =[select ID, Name from Account where Name IN : accNamestring ];
        
        Map<String,Account> accMap = new Map<String,Account>();
        for(Account objacc : newAcclist){
           accMap.put(objacc.Name, objacc);
        }
        
        for(Account objacc : acclist){
            if(accMap.containskey(objacc.Name)){
                objacc.addError('Same type of name already exist in Account');
            }
        }
   }
}