public class SchedualbeBatchLec58Story2APPLI implements schedulable {
 
    public void execute(schedulablecontext SC){
        database.executeBatch(new BatchLec58Story2APPLI());
    }
}