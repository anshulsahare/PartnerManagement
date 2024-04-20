public class wrapperexample2 {
 
 list<Applicant__c> appList = new list<Applicant__c>();
 list<Account> accList = new list<Account>();
 list<wrapper> lstw = new list<wrapper>();
 
 public list<wrapper> getlstWrapperString(){
  
  appList=[select Id,First_Name__c, Last_Name__c, Gender__c from Applicant__c LIMIT 10];
  accList=[select Name, Rating, Id from Account];
  
  for(integer i=0; i<appList.size(); i++){
   lstw.add(new wrapper(appList[i].First_Name__c,appList[i].Last_Name__c,appList[i].Gender__c,accList[i].Name,accList[i].Rating ));
  }
  return lstw;
 }
 
 public class wrapper{
   public string FName{get; set;}
   public string LName{get; set;}
   public string GenderAppli{get; set;}
   public string AccName{get; set;}
   public string AccRating{get; set;}
   
   public wrapper(string FName,string LName,string GenderAppli,string AccName,string AccRating){
     this.FName=FName;
     this.LName=LName;
     this.GenderAppli=GenderAppli;
     this.AccName=AccName;
     this.AccRating=AccRating;
   }
 }
 
 
 
}