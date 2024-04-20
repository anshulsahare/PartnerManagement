trigger OppNew on Opportunity (before insert,before update) {
    
    
    Public static void method(){
        
        list<Opportunity> oppList = [select Id,Name,StageNAme,Description,CreatedDate from Opportunity where CreatedDate=Last_Week];
        
        for(Opportunity objopp : oppList){
            if(objopp.StageNAme=='Closed Won'){
                objopp.Description='Opprtunity is closed won';  
            }
            else if(objopp.StageNAme=='Closed Lost'){
                objopp.Description='Opprtunity is closed Lost';  
            }
            else{
                objopp.Description='Opprtunity is open';  
            }
        }
        
        if(!oppList.isEmpty()){
            update oppList;
        }
        
    }
}