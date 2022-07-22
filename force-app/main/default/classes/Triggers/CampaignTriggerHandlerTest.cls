@isTest
public with sharing class CampaignTriggerHandlerTest {
    
    @isTest static void CampaignTriggerHandlerTest() {
        DemoCampaign__c result = new DemoCampaign__c();
        result.Name = 'Name1'; 
        result.DemoLocation__c = 'a057R000016fnrfQAA'; 
        insert result; 

        Test.startTest(); 
        try{
            DemoCampaign__c duplicateName = new DemoCampaign__c();
            duplicateName.Name = 'Name1'; 
            duplicateName.DemoLocation__c = 'a057R000016fnrfQAA'; 
        insert duplicateName; 

        } catch (Exception e){
            System.assertEquals('Insert failed. First exception on row 0; first error: FIELD_CUSTOM_VALIDATION_EXCEPTION, Campaign with this name already exists: []',
        e.getMessage());
        }
    
        Test.stopTest();

    }
}
