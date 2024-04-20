public class AccountClass {

    @AuraEnabled(cacheable=true)
   public static list<Account> accListProvider(){
   return [select Id,Name,Rating, Type from Account];
   }


  
  public list<Account> acclist  {get; set;}
    public AccountClass(ApexPages.StandardController controller) {
   acclist = [select Id,Name,Rating,Type from Account LIMIT 20];
    }


    @InvocableMethod(label='get account info' description='Get Contact and Opportunity')
    public static list<ActionResult> getContactsAndOpp(list<ActionRequest> inputs){
          list<ActionResult> results = new list<ActionResult>();
          for(ActionRequest request : inputs){
            results.add(invoke(request));
          }
          return results; 
    }

    public static ActionResult invoke(ActionRequest input){
      list<Contact> contacts = [
        SELECT Id, Name from Contact where AccountId =: input.accountId
        WITH SECURITY_ENFORCED LIMIT 10
      ];
      list<Opportunity> opportunities = [
        SELECT Id, Name, Amount from Opportunity where AccountId =: input.accountId
        WITH SECURITY_ENFORCED LIMIT 10
      ];

      ActionResult result = new ActionResult();
      result.contacts = contacts;
      result.opportunities = opportunities;
      return result;
    }

    public class ActionRequest{
      @InvocableVariable
      public Id accountId;
    }

    public class ActionResult{
      @InvocableVariable(label='List of contacts')
     public list<Contact> contacts;
     @InvocableVariable(label='List of opportunities')
     public list<Opportunity> opportunities;
    }


  }