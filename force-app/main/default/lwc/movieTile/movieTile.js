import { LightningElement,api } from 'lwc';

export default class MovieTile extends LightningElement {

    @api movie;//taking the value from parent compo
    @api selectedid; // taking the Id from parent compo which is sending by child compo by
  

    clickHandler(event){
        console.log('Select Id = '+this.movie.imdbID);
        //customevent
        //1. created custom event to pass value from child to parent
        const evt = new CustomEvent("selectedmovie",{ //selectedmovie is a event name which passing to parent
         detail:this.movie.imdbID

        }) 
          

        //2. dispatchEvent
        this.dispatchEvent(evt);
    }

    get tileSelected(){
        return this.selectedid === this.movie.imdbID ? "tile selected" : "tile";
    }

}