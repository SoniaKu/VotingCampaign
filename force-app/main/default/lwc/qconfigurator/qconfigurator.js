import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import QUESTION_OBJECT from '@salesforce/schema/DemoQuestion__c';
import QNAME_FIELD from '@salesforce/schema/DemoQuestion__c.Name';
import QCAMPAIGN_FIELD from '@salesforce/schema/DemoQuestion__c.DemoCampaign__c';




export default class QuestionCreator extends LightningElement {
    objectApiName = QUESTION_OBJECT;
    fields = [QNAME_FIELD, QCAMPAIGN_FIELD ];
    handleSuccess(event) {
        const toastEvent = new ShowToastEvent({
            title: "Question created",
            message: "Record ID: " + event.detail.id,
            variant: "success"
        });
        this.dispatchEvent(toastEvent);
    }
}