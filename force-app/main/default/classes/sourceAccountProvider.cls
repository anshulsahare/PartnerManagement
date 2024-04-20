global class sourceAccountProvider {

    public static void getPanIndiaAccount(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:PanIndiaNamedCred/services/apexrest/getAccountData');
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        
        System.debug('Response Status Code = '+response.getStatusCode());
        
        if(response.getStatusCode() == 200){
            System.debug('Received Data = '+response.getBody());
            
            List<object> objList = (List<Object>) JSON.deserializeUntyped(response.getBody());
            List<Account> accListInsert = new List<Account>();
            
            for(object obj : objList){
                Map<String,Object> accMap = (Map<String,Object>) obj;
                
                System.debug('Id = '+accMap.get('Id'));
                System.debug('Name = '+accMap.get('Name'));
                System.debug('Type = '+accMap.get('Type'));
                System.debug('SLA = '+accMap.get('SLA__c'));
                
                Account objAcc = new Account();
                objAcc.Name = String.valueOf(accMap.get('Name'));
                objAcc.Type = String.valueOf(accMap.get('Type'));
                objAcc.SLA__c = String.valueOf(accMap.get('SLA'));
                
                accListInsert.add(objAcc);
                
               
            }
            
            if(!accListInsert.isEmpty()){
                Database.insert(accListInsert,false);
            }
            
        }
        
    }
   }