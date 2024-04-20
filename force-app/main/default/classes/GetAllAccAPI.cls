@RestResource(urlMapping='/getAllAccountDetails')
global class GetAllAccAPI {

    @httpGet
    global static list<Account> getAllAccountDetails(){
        return [select Id,Name,CreatedDate from Account where CreatedDate>2000-10-10T00:00:00Z];
    }
}