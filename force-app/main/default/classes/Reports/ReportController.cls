public with sharing class ReportController {

    @AuraEnabled(cacheable = true)
    public static List<sObject> getAnsweredQuestions(String campaignId) {
        return [SELECT Name FROM DemoQuestion__c WHERE DemoCampaign__c=:campaignId];
    }
    
    @AuraEnabled(cacheable=true)
    public static List<sObject> getAnsweredCampaigns() {
        return [SELECT Name FROM DemoCampaign__c WITH SECURITY_ENFORCED];
}
}
