public class sorceReqAPITriCls {
    
    @future(callout=true)
    public static void sendRecordsToTarget(set<Id> accIdset){
      list<Account> acclist = [select Id, Name, Type,SLA__c from Account where Id IN :accIdset ];
        
        system.debug('trigger record = '+acclist);
        system.debug('deserializ record = '+JSON.serialize(acclist));
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:PanIndiaNamedCred/services/apexrest/getAccountDetails2');
        request.setMethod('POST');
        
        //set the parameter
        request.setHeader('Content-Type', 'application/JSON;charset=UTF-8');
        request.setBody(JSON.serialize(acclist));
        
        HttpResponse response = http.send(request);
        system.debug('status code = '+response.getStatusCode());
        
        if(response.getStatusCode() == 200){
            system.debug('recived = '+response.getBody());
        }
    }
 }