import { LightningElement,wire } from 'lwc';
// Import message service features required for subscribing and the message channel
import {
    subscribe,
    unsubscribe,
    APPLICATION_SCOPE,
    MessageContext,
} from 'lightning/messageService';
import MOVIE_CAHNNEL from '@salesforce/messageChannel/messageChannels__c';

export default class MovieDetail extends LightningElement {

    subscription = null;
    @wire(MessageContext)
    messageContext;

    loadComponent =false;
    movieDetails ={};

 // Standard lifecycle hooks used to subscribe and unsubsubscribe to the message channel
    connectedCallback() {
        this.subscribeToMessageChannel();
    }

     disconnectedCallback() {
        this.unsubscribeToMessageChannel();
    }

   subscribeToMessageChannel() {
        if (!this.subscription) {
            this.subscription = subscribe(
                this.messageContext,
                MOVIE_CAHNNEL,
                (message) => this.handleMessage(message),
                { scope: APPLICATION_SCOPE }
            );
        }
    }

    unsubscribeToMessageChannel() {
        unsubscribe(this.subscription);
        this.subscription = null;
    }

    // Handler for message received by component
    handleMessage(message) {
        let movieIdreceiver = message.movieId; //movieId ye hh lmx vala
        this.fetchMovieDetails(movieIdreceiver)
    }

   async fetchMovieDetails(movieId){
        let url = `https://www.omdbapi.com/?i=${movieId}&plot=full&apikey=e4100110`;
        
       const res = await fetch(url);
       const data = await res.json();
       
       data.Ratings = data.Ratings[0].Value,
    //    console.log("data",data);
       this.movieDetails = data //storing the value of data in movieDetails object
       this.loadComponent=true;
    }
}