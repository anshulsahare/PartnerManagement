trigger Scenario3ACcount on Account (before insert) {
  
    set<string> accset = new set<string>();
    for(Account objacc :trigger.new){
        accset.add(objacc.Name);
    }
    list<Account> acclist = [select Id,Name from Account where Name IN : accset];
    delete acclist;
    
}