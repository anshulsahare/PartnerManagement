public with sharing class sourceAccountRequestAPI {
   public static void getAccountDetails(){
         Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:PanIndiaNamedCred/services/apexrest/getAccountDetails2?type=Prospect&sla=Gold');
        request.setMethod('GET');

        HttpResponse response = http.send(request);

        System.debug('Status Code = '+response.getStatusCode()); //OK 200
   }
}