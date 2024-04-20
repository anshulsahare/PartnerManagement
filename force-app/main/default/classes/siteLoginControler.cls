global class siteLoginControler {

    global string username {get; set;}
    global string password {get; set;}
    
    global pageReference login(){
        string startUrl = system.currentPageReference().getParameters().get('startUrl');
        return site.login(username, password, startUrl);
    }
    
    global siteLoginControler(){
        
    }
    
}