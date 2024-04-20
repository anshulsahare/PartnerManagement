trigger OnlineSce1Account on Account (before insert) {

    for(Account objacc : trigger.new){
        if(objacc.BillingStreet!=null){
        objacc.ShippingStreet=objacc.BillingStreet;
        }
        if(objacc.BillingCity!=null){
        objacc.ShippingCity=objacc.BillingCity;
        }
        if(objacc.BillingState!=null){
        objacc.ShippingState=objacc.BillingState;
        }
        if(objacc.BillingPostalCode!=null){
        objacc.ShippingPostalCode=objacc.BillingPostalCode;
        }
        if(objacc.BillingCountry!=null){
        objacc.ShippingCountry=objacc.BillingCountry;
        }
        }
        }