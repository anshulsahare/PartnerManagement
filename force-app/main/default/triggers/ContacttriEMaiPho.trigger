trigger ContacttriEMaiPho on Contact (before insert) {
   
    Map<String, Contact> emailMap = new Map<String, Contact>();
    Map<String, Contact> phoneMap = new Map<String, Contact>();
    for(Contact objcon : trigger.new) {
        if(trigger.isInsert) {
            emailMap.put(objcon.Email, objcon);
            phoneMap.put(objcon.Phone, objcon);
        }
        if(trigger.isUpdate) {
            if (objcon.Email != trigger.oldMap.get(objcon.Id).Email ){
                emailMap.put(objcon.Email,objcon);
            }
            if(objcon.Phone != trigger.oldMap.get(objcon.Id).Phone){
                phoneMap.put(objcon.Phone,objcon);
            }
        }
    }
    String errorMessage ='';
    //geting the Contacts whose Email or Phone already exists
    List<Contact> existingContactList = [Select Id, Email, Phone FROM Contact Where Email IN:emailMap.keySet() OR Phone IN:phoneMap.keySet()];
    if(existingContactList.size()> 0){
        for(Contact contactRec : existingContactList){
            if(contactRec.Email!=null){
                if(emailMap.get(contactRec.Email) != null){
                    errorMessage='Email ';
                }
            }
            if(contactRec.Phone!=null){
                if(phoneMap.get(contactRec.Phone) != null) {
                    errorMessage = errorMessage + (errorMessage != '' ? 'and Phone ' : 'Phone ');
                }
            }
            if(errorMessage!=''){
                trigger.new[0].addError('Your Contact '+errorMessage +' already exists in system.');
            }
        }
    } 
}