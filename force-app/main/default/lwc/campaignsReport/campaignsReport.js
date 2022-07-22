/* eslint-disable no-undef */
/* eslint-disable no-unused-vars */
/* eslint-disable @lwc/lwc/no-api-reassignments */
/* eslint-disable no-new-wrappers */
import {LightningElement,api,wire,track} from 'lwc';
import {loadScript} from 'lightning/platformResourceLoader';
import ChartJS from '@salesforce/resourceUrl/ChartJS';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import getResultsByQuestions from '@salesforce/apex/ReportLogic.getResultsByQuestions';
import getAnsweredQuestions from '@salesforce/apex/ReportController.getAnsweredQuestions';
import getAnsweredCampaigns from '@salesforce/apex/ReportController.getAnsweredCampaigns';

export default class CampaignsReport extends LightningElement {

    @track selectedCampaign;
    @track selectedQuestion;
    @track selectedAnswer; 
    @track resultName; 
    @track dataSet;
    showCampaigns = new Boolean(true); 
    showQuestions = new Boolean(false);  
    campaignOptions = [];
    questionOptions=[]; 
    value='';

       
    
    
// GET CAMPAIGNS PICKLIST
    @wire(getAnsweredCampaigns,{})
    setCampaignList({error,data}){
            console.log(JSON.stringify(data));
            if (error) {
                this.error = error;
            }
            if(data) {
                let options =[];
                data.forEach(element => {
                    options.push({label:element.Name, value:element.Id});
                    
                });
                this.campaignOptions = options; 
                this.showCampaigns = true; 
                this.showQuestions = false;    
            }
            
        }
    
 // GET QUESTIONS PICKLIST
        
    @wire(getAnsweredQuestions,{campaignId:'$selectedCampaign'})
    setQuestionsList({error,data}){
            if(error) {
                this.error = error; 
            }
            if(data){
                let options = [];
                data.forEach(element => {
                    options.push({label:element.Name, value:element.Id});
                });
                this.questionOptions = options; 
                this.showQuestions = true; 
          
            }
        }
//ONCHANGE HANDLERS
    handleCampChange(event) {
            this.selectedCampaign = event.detail.value;
            this.selectedQuestion = null; 
            }
    handleQuestChange(event) {
           this.selectedQuestion = event.detail.value;
            }

// DISPLAY CHART
    @wire(getResultsByQuestions,{questionId:'$selectedQuestion'}) 
    wiredDemoAnswers(result) {
            if (result.data) {
                this.dataSet = result.data;
    
                console.log(result.data);
                this.Initializechartjs();
            } else if (result.error) {
                console.log('error: ' + result.error);
            }
        }
    @api chartjsInitialized = false;
    renderedCallback() {
            if (this.chartjsInitialized) {
                return;
            }
            this.chartjsInitialized = true;
    
        Promise.all([
                    loadScript(this, ChartJS)
                ])
                .then(() => {
                    //this.Initializechartjs();
                })
                .catch(error => {
                    console.log(error.message)
                    this.dispatchEvent(
                        new ShowToastEvent({
                            title: 'Error loading chartJs',
                            message: error.message,
                            variant: 'error'
                        })
                    );
                });
        }
    
    Initializechartjs() {
            var piechart;
            var ctx = this.template.querySelector(".pie-chart").getContext('2d');
    
            piechart = new Chart(ctx, {
                type: 'pie',
                data: {
                    labels: Object.keys(this.dataSet),
                   
                    datasets: [{
                        label: 'count',
                        data: Object.values(this.dataSet),
                        backgroundColor: ["#ced900", "#d95300", "#005ad9", "#00d9bc"]
                            
                    }]
                    
                }
                
            });
        }
    
}
    
