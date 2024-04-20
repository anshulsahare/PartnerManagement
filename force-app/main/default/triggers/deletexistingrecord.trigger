trigger deletexistingrecord on Account (before insert) {

    set<string> accTypeset = new set<string>();
    for(Account objacc : trigger.new){
        accTypeset.add(objacc.Type);
    }
    list <Account> acclist = [select Id,Name,Type from Account where Type IN : accTypeset ];
        delete acclist;
}