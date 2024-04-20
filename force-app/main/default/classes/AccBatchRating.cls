global class AccBatchRating implements database.Batchable<sObject> {

    global database.querylocator start(database.BatchableContext BC){
  string strvar ='select Id,Name,Type,Rating from Account where Type=\'Customer - Direct\' ';
        return database.getQueryLocator(strvar);
   }
   global void execute(database.BatchableContext BC, list<Account> acclist){
   if(!acclist.IsEmpty()){
   for(Account objacc : acclist){
        objacc.Rating='Hot';
      }
       database.update(acclist, false);
    }
   }
   global void finish(database.BatchableContext BC){
   database.executeBatch(new AccBatchRatingChaining());
   }
}