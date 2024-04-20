@RestResource(urlMapping='/getAllAccountss')
global class accPrAPI {

    @httpget
    global static list<Account> getAllAccountss(){
        return [select id,Name from Account LIMIT 10];
    }
}