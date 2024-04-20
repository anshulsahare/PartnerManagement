import { LightningElement } from 'lwc';

export default class QuizApp extends LightningElement {

    myQuestion = [
          
        {
          id:'Question1',
          question :'which one of the following is not template loop',
          answer : {
            a : 'for each',
            b : 'for-loop',
            c : 'map loop'
          },
          correctAnswer : "c"
        },

        {
            id:'Question2',
            question :'which one of the following is an invalid component',
            answer : {
              a : '.svg',
              b : '.js',
              c : '.apex'
            },
            correctAnswer : "c"
          },

          {
            id:'Question3',
            question :'file name in lwc',
            answer : {
              a : '.html',
              b : '.js',
              c : '.all',
            },
            correctAnswer : "c"
          },

    ]

    selected={}  //for storing answer
    correctAnswer = 0; // to show the result
    showOutPut = false;

    //changeHandler get's called on every click on the options
    changeHandler(event){
      console.log("Name ", event.target.name)
      console.log("Value ", event.target.value)

      // const name = event.target.name;
      // const value = event.target.value;
      // insted using above two line we can use like below
      
      const {name, value} = event.target;

      this.selected={...this.selected, [name]:value};
      //So how it work ??
      //if we selected first option of first question so its value stored in this.selected
      //but if we click on another option so first value will be replaced by second value
    }

    //this button is inside the form and form refresh the Page , so to avoid this we used preventDefault
    
    saveHandler(event){
     event.preventDefault()
     // video me dekh lena (33.20 tym) smj jayenga
     let correct = this.myQuestion.filter(item=>this.selected[item.id] === item.correctAnswer)  //filer alws return an array
     this.correctAnswer = correct.length;
     this.showOutPut = true;
     console.log("correct answer is"+this.correctAnswer);
    }

    resetHandler(){
     this.selected={}
     this.correctAnswer=0
     this.showOutPut=false;
     
     
    }
  
    //used for disabling submit button
    get allNotSelected(){
      return !(Object.keys(this.selected).length === this.myQuestion.length)
      // So yha smj lena easy hh bht
      //jitne option select kr rhe hh o agr myquestion me jitne hh utne nh rhe to button disbale rhengi
    }
}