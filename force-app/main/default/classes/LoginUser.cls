global class LoginUser {

    @AuraEnabled
    global static string login(string username, string password){
        string homeUrl ='https://airtellimited68-dev-ed.my.site.com/amazonproducts/s/';
        apexPages.pageReference pageRef = site.login(username, password, homeUrl);
                                          //calling from siteLoginControler 
        return pageRef.getUrl();
    }
    
}