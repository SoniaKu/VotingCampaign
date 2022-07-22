@isTest
public with sharing class ResultTriggerHandlerTest {
    @isTest static void ResultTriggerHandlerTest() {     
        Test.startTest();
        DemoResult__c result = new DemoResult__c();
        result.Name = 'TestResult'; 
        result.DemoCampaign_del__c = 'a007R000010bc6nQAA'; 
        result.DemoQuestion__c = 'a017R00004AEwBCQA1';
        result.DemoAnswer__c = 'a027R00000qlQ1lQAE'; 
        insert result;

        try{
        DemoResult__c duplicate = new DemoResult__c();
        duplicate.Name = 'TestResult2'; 
        duplicate.DemoCampaign_del__c = 'a007R000010bc6nQAA'; 
        duplicate.DemoQuestion__c = 'a017R00004AEwBCQA1';
        duplicate.DemoAnswer__c = 'a027R00000qlQ1lQAE'; 
            insert duplicate; 
        } catch (Exception e){
            System.assertEquals('You\'re only allowed to vote once for each question',
        e.getMessage());
        }
    
        Test.stopTest();
    }
}