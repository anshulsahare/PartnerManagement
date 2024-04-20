import { LightningElement,wire } from 'lwc';
// Import message service features required for publishing and the message channel
import { publish, MessageContext } from 'lightning/messageService';
import MOVIE_CAHNNEL from '@salesforce/messageChannel/messageChannels__c';


const DELAY = 300;//movie search krenge & onchange event hh so ek word v likha to API call hongi baar baar aisa na ho krk ye kr rhe DEBOUNCING
export default class MovieSearch extends LightningElement {
 
    selectedType = '';
    seleectedSearch='';
    selectedPageno='1';
    loading=false;
    delayTimeOut;
    selectedMovie ="" ; //variable to storing the Id of selectd movie & [Now passing this ID to child]
    searchResult=[];

    @wire(MessageContext)
    messageContext;

    get typeoptions() {
        return [
            { label: 'None', value: " " },
            { label: 'movie', value: 'movie' },
            { label: 'series', value: 'series' },
            { label: 'episode', value: 'episode' },
        ];
    }

    handleChange(event) {
        let{name, value} = event.target;
        this.loading=true;
        if(name==='type'){
           this.selectedType=value; 
        }
        else if(name==="enter-search"){
            this.seleectedSearch=value;
        }
        else if(name==='pageno'){
            this.selectedPageno=value;
        }
        //we call DEBOUNCING
        //setTimeout alws take two parameter - 1st is CallBack Function , 2nd is DELAY
          clearTimeout(this.delayTimeOut );//clear existing timeout
          this.delayTimeOut = setTimeout(() => { //now storing setTimeout in one variable
          this.searchMovie();
        },DELAY);
    }

    //this method will search for the entered movie
    async searchMovie(){
        //const url =`http://www.omdbapi.com/?s=${enteredValue}&type=${this.selectedType}&page=${this.pageNumber}&apikey=e4100110`
        const url =`https://www.omdbapi.com/?s=${this.seleectedSearch}&type=${this.selectedType}&page=${this.selectedPageno}&apikey=e4100110`; //dynamic seach we passing to return mmovie
        const res = await fetch(url); //fetch method alws return promise & to handle this we use ASYNC AWAIT
        //we are calling API using URL & storing API call in VARIABLE RES
        const data = await res.json();      
        console.log('Movie Search OutPut ='+JSON.stringify(data));
        this.loading=false;
        if(data.Response==="True"){
            this.searchResult=data.Search;//console se check kiya to search me data me value aarhe h
        }
    }

    movieSelectdHandler(event){
        this.selectedMovie = event.detail;//Detail q, q ki apn value send kr rhe detail se
        
        const payload = { movieId: this.selectedMovie };

        publish(this.messageContext, MOVIE_CAHNNEL, payload);
    }

    get displaySearchResult(){
        return this.searchResult && this.searchResult.length > 0 ? true : false ;
    }
}