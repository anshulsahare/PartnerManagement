trigger conEmailPhoneDupli on Contact (before insert) {
    
    set<string> emailSet = new set<string>();
    set<string> phoneset = new set<string>();
    for(Contact objcon : trigger.new){
        emailSet.add(objcon.Email);
        phoneset.add(objcon.Phone);
    }
    
    list<Contact> conlist = [select Id,Name,Email,Phone from Contact where Email IN :emailSet or Phone IN :phoneset];
    
    Map<string,Contact> conMapEmail = new Map<string,Contact>();
    Map<string,Contact> conMapPhone = new Map<string,Contact>();
    for(Contact objcon : conlist){
        conMapEmail.put(objcon.Email, objcon);
        conMapPhone.put(objcon.Phone, objcon);
    }
    
    for(Contact objcon : trigger.new){
        if(conMapEmail.containsKey(objcon.Email) && conMapPhone.containsKey(objcon.Phone)){
            objcon.addError('Duplicate Email or Phone exist');
        }
    }
}