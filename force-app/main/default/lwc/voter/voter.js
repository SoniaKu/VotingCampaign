/* eslint-disable no-dupe-class-members */
/* eslint-disable no-unused-vars */
/* eslint-disable no-new-wrappers */
import { LightningElement, track, wire} from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getCampaignsList from '@salesforce/apex/VoterHandler.getCampaignsList';
import getQuestionsList from '@salesforce/apex/VoterHandler.getQuestionsList';
import getAnswersList from '@salesforce/apex/VoterHandler.getAnswersList';
import addNewResult from'@salesforce/apex/Event.addNewResult'; 

export default class Voter extends LightningElement {
@track selectedCampaign;
@track selectedQuestion;
@track selectedAnswer; 
@track resultName; 

showCampaigns = new Boolean(true); 
showQuestions = new Boolean(false); 
showAnswers = new Boolean(false); 
showNamePanel = new Boolean(false); 

campaignOptions = [];
questionOptions=[];
answerOptions=[];
value='';

   


  // GET CAMPAIGNS PICKLIST
    @wire(getCampaignsList,{})  
    setCampaignList({error,data}){
        
        if (error) {
            this.error = error;
        }
        if(data) {
            console.log(JSON.stringify(data));
            let options =[];
            data.forEach(element => {
                options.push({label:element.Name, value:element.Id});                
            });
            this.campaignOptions = options; 
            this.showCampaigns = true; 
            this.showQuestions = false; 
            this.showAnswers = false; 
            this.showNamePanel = false;            
        }       
    }

 // GET QUESTIONS PICKLIST
    
    @wire(getQuestionsList,{campaignId:'$selectedCampaign'})
    setQuestionsList({error,data}){
        if(error) {
            this.error = error; 
        }
        if(data){
            console.log(JSON.stringify(data));
            let options = [];
            data.forEach(element => {
                options.push({label:element.Name, value:element.Id});
            });
            this.questionOptions = options; 
            this.showQuestions = true; 
            this.showAnswers = false; 
            this.showNamePanel = false;
        }
    }
  
  // GET ANSWERS PICKLIST

    @wire(getAnswersList,{questionId:'$selectedQuestion'})
        setAnswersList({error,data}){
                
        if(error) {
            this.error = error; 
        }
        if(data){
            let options = [];
            data.forEach(element => {
                options.push({label:element.Name, value:element.Id});
            });
            this.answerOptions = options; 
            this.showAnswers = true; 
            this.showNamePanel = true;
        }
    }
    
// ONSELECT -> SHOW LISTS ACCORDINGLY TO USER'S CHOICE 
    handleCampChange(event) {
         this.selectedCampaign = event.detail.value;
         this.selectedQuestion = null; 
         this.selectedAnswer = null; 
        }
    handleQuestChange(event) {
        this.selectedQuestion = event.detail.value;
        this.selectedAnswer = true;     
        }
   handleAnswChange(event) {
        this.selectedAnswer = event.detail.value;  
        }
    changeResultName(event){
        this.resultName = event.target.value; 
        }

// INSERT TO DATABASE   
    addResult(){
        addNewResult({Name:this.resultName, Campaign:this.selectedCampaign, Question:this.selectedQuestion, Answer:this.selectedAnswer})
            .then(result => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'Vote submited',
                        variant: 'success',
                        mode: 'dismissable'
                    })
                );
            })
            .catch(error => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error Message',
                        message: error.body.message,
                        variant: 'error',
                        mode: 'dismissable'
                    })
                );
            });
        }
    }