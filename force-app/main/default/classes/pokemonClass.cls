public with sharing class pokemonClass {
   
    @AuraEnabled(cacheable=true)
    public static list<Pokemon__c> getPokemonlist(String searchKey) {
      if(searchKey != ''){
         String searchPokemon = '%'+searchKey+'%';
         list<Pokemon__c> pokemonSearchList = [Select ID,Name,Image_url__c,Image__c, Height__c, Weight__c,Trainer__r.Name from Pokemon__c where Name  LIKE : searchPokemon];
         return pokemonSearchList;
      } 
      else{
         list<Pokemon__c> pokemonList = [Select ID,Name,Image_url__c,Image__c, Height__c, Weight__c,Trainer__r.Name from Pokemon__c ];
         return pokemonList;
      }
   }
}