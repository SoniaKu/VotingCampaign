trigger CampaignTrigger on DemoCampaign__c (before insert) {
        TriggerDispatcher.run(new CampaignTriggerHandler());
        }
