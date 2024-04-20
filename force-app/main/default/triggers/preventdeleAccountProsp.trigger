trigger preventdeleAccountProsp on Account (before delete) {

    for(Account objacc : trigger.old){
        if(string.isNotBlank(objacc.Type)){
            if(objacc.Type=='Prospect'){
                objacc.Type.adderror('user cant delete the record if Account  Type is Prospect');
        }
      }
    }
    
   }