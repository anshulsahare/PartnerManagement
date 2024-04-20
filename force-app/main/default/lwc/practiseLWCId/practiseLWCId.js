import { LightningElement} from 'lwc';
// const audio = new Audio("https://www.soundjay.com/buttons/sounds/button-2.mp3");
import music from "@salesforce/resourceUrl/music";


    export default class PractiseLWCId extends LightningElement {
    musicFile = music;
   handleClickSong() {
        const audioPlayer = this.template.querySelector('audio');
       
            audioPlayer.play();
       
    }
 }