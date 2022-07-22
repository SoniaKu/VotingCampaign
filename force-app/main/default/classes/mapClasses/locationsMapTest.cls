@isTest
public with sharing class locationsMapTest {
    @isTest static void locationsMapTest() {
        Test.startTest(); 
        Integer sizeBefore = locationsMap.getLocationsList().size(); 
        DemoLocation__c testLocation = new DemoLocation__c(
        Name = 'Test7'
        );
        insert testLocation; 
        Integer sizeAfter = locationsMap.getLocationsList().size(); 
        Test.stopTest(); 
        System.assert(sizeAfter == (sizeBefore +1 ));

    }
}
