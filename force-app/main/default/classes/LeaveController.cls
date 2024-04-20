public with sharing class LeaveController {
   
   @AuraEnabled(cacheable=true)
   public static list<LeaveRequest__c> getMyLeave(){
    list<LeaveRequest__c> listLeave =[select Id,Name, From_Date__c, To_Date__c, Reason__c, Status__c, Manager_Comment__c from LeaveRequest__c ORDER BY CreatedDate DESC];
    return listLeave;
   }

   @AuraEnabled(cacheable=true)
   public static list<LeaveRequest__c> getLeaveRequest  (){
    list<LeaveRequest__c> listLeave =[select Id,Name, From_Date__c, To_Date__c, Reason__c, Status__c, Manager_Comment__c from LeaveRequest__c where user__c =:UserInfo.getUserid() order by createdDate DESC];
    return listLeave;
   }

  }