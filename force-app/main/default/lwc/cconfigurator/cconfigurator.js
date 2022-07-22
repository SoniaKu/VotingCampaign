import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import CAMPAIGN_OBJECT from '@salesforce/schema/DemoCampaign__c';
import CNAME_FIELD from '@salesforce/schema/DemoCampaign__c.Name';
import START_FIELD from '@salesforce/schema/DemoCampaign__c.StartDates__c';
import END_FIELD from '@salesforce/schema/DemoCampaign__c.EndDates__c';
import STATUS_FIELD from '@salesforce/schema/DemoCampaign__c.Status__c';
import LNAME_FIELD from '@salesforce/schema/DemoCampaign__c.DemoLocation__c';

export default class CampaignCreator extends LightningElement {
    objectApiName = CAMPAIGN_OBJECT;
    fields = [CNAME_FIELD, START_FIELD, END_FIELD, STATUS_FIELD, LNAME_FIELD];
    handleSuccess(event) {
        const toastEvent = new ShowToastEvent({
            title: "Campaign created",
            message: "Record ID: " + event.detail.id,
            variant: "success"
        });
        this.dispatchEvent(toastEvent);
    }
}