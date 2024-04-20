import { LightningElement, track } from 'lwc';
import retriveNews from '@salesforce/apex/newsProjectClass.retriveNews';


export default class NewsProject extends LightningElement {
 
    @track result=[];
    @track selectedNews=[];
    @track isModalOpen = false;

    get modalClass(){
        return this.isModalOpen ? "slds-modal slds-fade-in-open" : "slds-modal"
        //or you can write like below
        // return `slds-modal ${this.isModalOpen ? "slds-fade-in-open" :""}`
    }

    get modalBackDropClass(){
        return this.isModalOpen ? "slds-backdrop slds-backdrop-open" : "slds-backdrop"
        //same for this too
    }


    connectedCallback(){
        this.fetchNews();
    }

    fetchNews(){
        retriveNews().then(response=>{
            console.log(response);
            this.formatNewsData(response.articles)
        }).catch(error=>{
            console.log(error);
        })
    }

    formatNewsData(res){
     this.result =  res.map((item, index)=>{
     let id = `new_${index+1}`;
     let date = new Date(item.publishdAt).toDateString();
     let name = item.source.name;
     return {...item, id:id, name:name, date:date}
            });
    
    }

    showModal(event){
   let id = event.target.dataset.item;
   this.result.forEach(item=>{
    if(item.id === id){
        this.selectedNews = {...item}
    }
   })
   this.isModalOpen= true;
  }
  closeModal(){
    this.isModalOpen= false;
  }
}