@isTest
public class BatchAccToOpplect88TESTCLASS {

    @testsetup
    public static void setup(){
        //HOT
        Account objaccHot = new Account(Name='Rawan', Rating='Hot');
        insert objaccHot;
        
        list<Opportunity> opplistHot = new list<Opportunity>();
        for(integer i=1; i<200; i++){
        Opportunity objoppHot =new Opportunity(Name='Ram'+i,StageName='Qualification',AccountId=objaccHot.Id);
            opplistHot.add(objoppHot);
      }
        if(!opplistHot.isEmpty()){
            database.insert(opplistHot, false);
            
            //WARM
            Account objaccWarm = new Account(Name='Rawan', Rating='Warm');
            insert objaccWarm;
            
            list<Opportunity> opplistWarm = new list<Opportunity>();
            for(integer i=1; i<200; i++){
                Opportunity objoppWarm =new Opportunity(Name='Ram'+i,StageName='Qualification',AccountId=objaccWarm.Id);
                opplistWarm.add(objoppWarm);
            }
        }
    }
    @isTest
    public static void testBatchAccToOpplect88(){
        Test.startTest();
        database.executeBatch(new BatchAccToOpplect88(),200);
        Test.stopTest();
    }
}