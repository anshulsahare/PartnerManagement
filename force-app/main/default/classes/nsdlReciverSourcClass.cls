public with sharing class nsdlReciverSourcClass {

    @AuraEnabled
    public static string  nsdlReciverSourcClass(string panCard) {
     Http http = new Http();
     HttpRequest request = new HttpRequest();
     request.setEndPoint('callout:PanIndiaNamedCred/services/apexrest/v1/getAccountDetails1?PanCardNumber=+panCard');
     request.setMethod('GET');

     HttpResponse response = http.send(request);
     System.debug('Status Code = '+response.getStatusCode()); //OK 200

     if(response.getStatusCode() == 200){
        string receivedData;

        System.debug('recived = '+response.getBody());
       Map<string,Object> panMap= ( Map<string,Object>) JSON.deserializeUntyped(response.getBody());
         
       receivedData = 'First Name = '+panMap.get('First_Name__c')+', Last Name = '+panMap.get('Last_Name__c')+', Gender = '+panMap.get('Gender__c')+', Pan Number = '+panMap.get('PAN_Card_Number__c');
        return receivedData;
 
     }
     else{
        return null;
     }
    }
}