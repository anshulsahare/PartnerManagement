trigger oppCustomTrigg on Opportunity (before insert, before update) {

    for(Opportunity objopp : trigger.new){
        if(objopp.Customer_Type__c=='Normal'){
            Diwali_discount__c objdiwali = Diwali_discount__c.getOrgdefaults();
            objopp.Discount_percentage__c = objdiwali.Discount_percentage__c;
            objopp.Discount_Ammount__c = (objopp.Amount * objdiwali.Discount_percentage__c)/100;
            objopp.Actual_Ammount_after_discount__c = objopp.Amount - ((objopp.Amount * objdiwali.Discount_percentage__c)/100);
        }
        else{
            if(objopp.Customer_Type__c=='Primary'){
                Diwali_discount__c objdiwali = Diwali_discount__c.getInstance(userinfo.getProfileId());
                objopp.Discount_percentage__c = objdiwali.Discount_percentage__c;
                objopp.Discount_Ammount__c = (objopp.Amount * objdiwali.Discount_percentage__c)/100;
                objopp.Actual_Ammount_after_discount__c = objopp.Amount - ((objopp.Amount * objdiwali.Discount_percentage__c)/100);
            }
            else{
                if(objopp.Customer_Type__c=='Special'){
                    Diwali_discount__c objdiwali = Diwali_discount__c.getInstance(userinfo.getUserId());
                objopp.Discount_percentage__c = objdiwali.Discount_percentage__c;
                objopp.Discount_Ammount__c = (objopp.Amount * objdiwali.Discount_percentage__c)/100;
                objopp.Actual_Ammount_after_discount__c = objopp.Amount - ((objopp.Amount * objdiwali.Discount_percentage__c)/100);
                }
            }
        }
    }
}