trigger objtrigg on Account (before Insert) {

    set<String> Accset = new set<string>();
    for(Account objacc : trigger.new){
        if(!string.isBlank(objacc.Name)){
            Accset.add(objacc.Name);
        }
    }
    list<Account> acclist = [select Id,Name from Account where Name IN : Accset ];
    Map<string, Account> accMap = new  Map<string, Account>();
    for(Account objacc : acclist){
    accMap.put(objacc.Name, objacc);
    }
     
    for(Account objacc : trigger.new){
        if(accMap.containsKey(objacc.Name)){
            objacc.addError('Duplicate Account Name Found');
        }
    }
}