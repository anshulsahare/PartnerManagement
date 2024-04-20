@RestResource(urlMapping='/getAllAccount')
global class AccProviderIntegration {

    @httpget
    global static List<Account> getAllAccount(){
        RestRequest request = RestContext.request;
        RestResponse response = RestContext.response;
        string receivedData = request.requestBody.toString();
        
        WrapperClass objWrapperClass = (WrapperClass) JSON.deserialize(receivedData, WrapperClass.class);
        
        return ([select Id,Name,Rating from Account where Name =: objWrapperClass.Name]);
    }
    
    global class WrapperClass{
        string Name;
    }
}