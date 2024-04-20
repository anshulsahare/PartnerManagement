trigger AccountTrigger45story1 on Account (before insert) {
set<string> accnameset = new set<string>();
    
    for(Account objacc : trigger.new){
        accnameset.add(objacc.Name);
    }
    
    list<Account> alist = [ select Id,Name from Account where Name IN: accnameset];
    delete alist;
}