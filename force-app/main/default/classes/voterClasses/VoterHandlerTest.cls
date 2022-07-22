@isTest
public with sharing class VoterHandlerTest {
    @isTest static void campaignsListTest() {
        Test.startTest(); 
        Integer sizeBefore = VoterHandler.getCampaignsList().size(); 
        DemoCampaign__c testCamp = new DemoCampaign__c(
        Name = 'Test3',
        DemoLocation__c='a057R000016fnrfQAA',
        Status__c='In progress'
        );
        insert testCamp; 
        Integer sizeAfter = VoterHandler.getCampaignsList().size(); 
        Test.stopTest(); 
        System.assert(sizeAfter == (sizeBefore +1 ));
    }

    @isTest static void questionsListTest() {
        Test.startTest(); 
        Integer sizeBefore = VoterHandler.getQuestionsList('a007R000010bc6nQAA').size(); 
        DemoQuestion__c testCamp = new DemoQuestion__c(
        Name = 'Test4',
        DemoCampaign__c='a007R000010bc6nQAA'
        );
        insert testCamp; 
        Integer sizeAfter = VoterHandler.getQuestionsList('a007R000010bc6nQAA').size();  
        Test.stopTest(); 
        System.assert(sizeAfter == (sizeBefore +1 ));
    }

    @isTest static void answersListTest() {
        Test.startTest(); 
        Integer sizeBefore = VoterHandler.getAnswersList('a017R00004AEwBCQA1').size(); 
        DemoAnswer__c testCamp = new DemoAnswer__c(
        Name = 'Test5',
        DemoQuestion__c='a017R00004AEwBCQA1'
        );
        insert testCamp; 
        Integer sizeAfter = VoterHandler.getAnswersList('a017R00004AEwBCQA1').size();  
        Test.stopTest(); 
        System.assert(sizeAfter == (sizeBefore +1 ));

    }
}
