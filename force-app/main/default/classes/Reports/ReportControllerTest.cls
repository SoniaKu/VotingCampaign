@isTest
public with sharing class ReportControllerTest {
    
    @isTest static void getCampaignsTest() {
    test.startTest(); 
        Integer sizeBefore = ReportController.getAnsweredCampaigns().size(); 
        DemoCampaign__c dc = new DemoCampaign__c();
        dc.Name='Test1';
        dc.DemoLocation__c = 'a057R000016fnrfQAA';
        insert dc; 
        Integer sizeAfter = ReportController.getAnsweredCampaigns().size(); 
    test.stopTest(); 
        System.assert(sizeAfter == (sizeBefore +1 ));
    }

    @isTest static void getQuestionstest() {
    test.startTest(); 
        Integer sizeBefore = ReportController.getAnsweredQuestions('a007R000010bc6nQAA').size();
        DemoQuestion__c dc = new DemoQuestion__c();
        dc.Name='Test2';
        dc.DemoCampaign__c = 'a007R000010bc6nQAA';
        insert dc; 
        Integer sizeAfter = ReportController.getAnsweredQuestions('a007R000010bc6nQAA').size(); 
    test.stopTest(); 
        System.assert(sizeAfter == (sizeBefore +1 ));

    }
}
