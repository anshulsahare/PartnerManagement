global class BatchLec58Story1OPP implements database.Batchable<sObject>{

global database.querylocator start(database.batchablecontext BC){
      return database.getquerylocator('select id, Amount,StageName from Opportunity where StageName=\'Closed Won\' and Amount!=0 ');
      }
global void execute(database.batchablecontext BC, list<Opportunity> opplist){
         for(Opportunity objopp : opplist){
         objopp.Amount=0;
         }
      }
global void finish(database.batchablecontext BC){
  
  }

}