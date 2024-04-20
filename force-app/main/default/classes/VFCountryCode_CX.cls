public with sharing class VFCountryCode_CX {

   public string selectString {get; set;}
   public string contryCode {get; set;}
   public VFCountryCode_CX (ApexPages.StandardController controller) {

  }
  public list<selectoption> getcontriesoption(){
  list<selectoption> countryOption= new list<selectoption>();

  map<string, Country_Codes__c> countrycodemap = Country_Codes__c.getAll();
  countryOption.add(new selectoption('', '__None__'));

  for(string countryName  :countrycodemap.keyset()){
  string cLabel = CountryName;
  string value = countrycodemap.get(countryName).Code_Number__c;

  countryOption.add(new selectoption(value , cLabel ));
  }
  return countryOption;
   }

}