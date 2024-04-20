public class NewCaseListController {
 
    public list<Case> getNewcases(){
     List<Case>  filterList = [select Id, CaseNumber from Case where status ='New'];
        return filterList;
    }
}