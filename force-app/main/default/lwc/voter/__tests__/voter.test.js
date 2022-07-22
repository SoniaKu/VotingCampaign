import { createElement } from 'lwc';
import Voter from 'c/voter';
import getCampaignsList from '@salesforce/apex/VoterHandler.getCampaignsList';
import getQuestionsList from '@salesforce/apex/VoterHandler.getQuestionsList';
import getAnswersList from '@salesforce/apex/VoterHandler.getAnswersList';


describe('c-voter', () =>{
    afterEach( () => {
        while(document.body.firstChild){
            document.body.removeChild(document.body.firstChild)
        }
    })

    it('doesnt show the questions', () => {
        const element = createElement('c-voter', {
            is: Voter
            });
        document.body.appendChild(element);
        getCampaignsList();
            return Promise.resolve().then(() => {
                const outputElement = element.shadowRoot.querySelector('.combobox-output');
            expect(outputElement).toBeNull();
            });
    }); 


    it('doesnt show the answers', () => {
        const element = createElement('c-voter', {
            is: Voter
        });
        document.body.appendChild(element);
    getQuestionsList(); 
    return Promise.resolve().then(()=> {
        const outputElement = element.shadowRoot.querySelector('.combobox-output');
            expect(outputElement).toBeNull();

        });
        });
        it('show answers and name field', () => {
            const element = createElement('c-voter', {
                is: Voter
            });
            document.body.appendChild(element);
            getAnswersList(); 
        return Promise.resolve().then(()=> {
            const outputElement = element.shadowRoot.querySelector('.combobox-output');
                expect(outputElement).toBeNull();
    
            });
            });
   
        })