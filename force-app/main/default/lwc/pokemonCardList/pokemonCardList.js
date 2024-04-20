import { LightningElement,track } from 'lwc';
import getPokemonlist from '@salesforce/apex/pokemonClass.getPokemonlist';

export default class PokemonCardList extends LightningElement {

    pokemon;
    error;
    @track pokemonName='';

    connectedCallback(){
        this.loadGetPokemonList(this.pokemonName);
    }
    loadGetPokemonList(pokemonName){
        getPokemonlist({searchKey : pokemonName})
        .then(result=>{
         this.pokemon=result;
         console.log('this.pokemon',this.pokemon);
        })
        .catch(error=>{
        this.error=error;
        })
    }

    serachPokemonHandler(event){
       this.pokemonName= event.target.value;
       console.log('this.pokemonName',this.pokemonName);
        this.loadGetPokemonList(this.pokemonName)
    }

}