public with sharing class locationsMap {
    @AuraEnabled(cacheable=true)
    public static List<DemoLocation__c> getLocationsList() {
        
         return [SELECT Name, Country__c, City__c, Street__c, geoLoc__c FROM DemoLocation__c WITH SECURITY_ENFORCED];

    }
}
