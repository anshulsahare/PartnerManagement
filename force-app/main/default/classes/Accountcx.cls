public class Accountcx {

public list<Account> acclist {get; set;}
    public Accountcx(ApexPages.StandardController controller) {
       
       acclist =[select Id,Name,Rating,SLA__c,Type from Account LIMIT 10];
    }

}