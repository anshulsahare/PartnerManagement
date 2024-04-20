public with sharing class newsProjectClass {

    @AuraEnabled
    public static map<string, Object> retriveNews() {
     httpRequest httprequest = new httpRequest();
     httprequest.setEndPoint('https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=8d2316869d3f41528eb4eb88c73ea0dd');
     httprequest.setMethod('GET');

    Map<string, Object> newsJsonData = new Map<string, Object>();
    String strResponse = null;

    try{
        http https = new http();
        httpResponse httpresponse = https.send(httprequest);
        if(httpresponse.getStatusCode()==200){
            strResponse = httpresponse.getBody();
        }
        else{
            throw new CalloutException(httpresponse.getBody());
        }
    }
    catch(Exception ex){
            throw ex;
    }

    if(!string.isBlank(strResponse)){
        newsJsonData = (Map<string, Object>)JSON.deserializeUntyped(strResponse);
    }
    if(!newsJsonData.isEmpty()){
        return newsJsonData;
    }
    else{
        return null;
    }
 }
}