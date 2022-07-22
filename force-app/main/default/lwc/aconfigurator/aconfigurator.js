import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import ANSWER_OBJECT from '@salesforce/schema/DemoAnswer__c';
import ANAME_FIELD from '@salesforce/schema/DemoAnswer__c.Name';
import AQUEST_FIELD from '@salesforce/schema/DemoAnswer__c.DemoQuestion__c';

export default class Aconfigurator extends LightningElement {
    objectApiName = ANSWER_OBJECT;
    fields = [ANAME_FIELD, AQUEST_FIELD];
    
    handleSuccess(event) {
        const toastEvent = new ShowToastEvent({
            title: "Answer created",
            message: "Record ID: " + event.detail.id,
            variant: "success"
        });
        this.dispatchEvent(toastEvent);
    }
}