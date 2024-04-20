trigger Scenario11Lead on Lead (before insert, before update) {
    
    set<string> setEmail = new  set<string>();
    for(Lead objLead : trigger.new)
    {
        if(String.isNotBlank(objLead.Email))
            setEmail.add(objLead.Email);
        else
            objLead.addError('You must provide Email.');
    }
    set<string> setConEmail = new set<string>();
        for(Contact objCon : [select email from Contact where email in :setEmail])
            setConEmail.add(objCon.Email);
    if(!setConEmail.isEmpty())
        for(Lead objLead : trigger.new)
            if(setConEmail.contains(objLead.Email))
                objLead.addError('You can\'t create another Lead on this Email.');
}