@RestResource(urlMapping='/getAccountDetails')
global class AccProviderAPI {

    @httpget
    global static list<Account> getAccountDetails(){
        return [select Id,Name from Account LIMIT 10];
    }
}