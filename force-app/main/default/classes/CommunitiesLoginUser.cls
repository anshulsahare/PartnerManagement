global class CommunitiesLoginUser {

    global CommunitiesLoginUser(){
        
    }
    
    //forwardToAuthPage is a method which return the PageReference
    global PageReference forwardToAuthPage(){
        string startUrl = system.currentPageReference().getParameters().get('startURL');
        string displayType = system.currentPageReference().getParameters().get('display');
        return Network.forwardToAuthPage(startUrl, displayType);
    }
}