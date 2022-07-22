public with sharing class VoterHandler {
    


    @AuraEnabled(cacheable=true)
    public static List<sObject> getAnswersList(String questionId) {
        return [SELECT Id, Name FROM DemoAnswer__c WHERE DemoQuestion__c =:questionId WITH SECURITY_ENFORCED];
    }


    @AuraEnabled(cacheable = true)
    public static List<sObject> getQuestionsList(String campaignId) {
        return [SELECT Id, Name FROM DemoQuestion__c WHERE Id NOT IN (SELECT DemoQuestion__c FROM DemoResult__c) AND DemoCampaign__r.Id =:campaignId WITH SECURITY_ENFORCED];
    }


    
    @AuraEnabled(cacheable=true)
    public static List<sObject> getCampaignsList() {
        return [SELECT Id, Name FROM DemoCampaign__c WHERE Status__c= 'In progress' WITH SECURITY_ENFORCED];

}
}