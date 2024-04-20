trigger AccountTriggerForTest on Account (before insert, before update) {
     
    for(Account objacc : trigger.new){
        if(string.isNotBlank(objacc.Rating)){
            if(objacc.Rating=='Hot'){
                objacc.Type='Prospect';
            }
            else{
                objacc.Type='';
            }
        }
        else{
            objacc.Type='';
        }
    }
}