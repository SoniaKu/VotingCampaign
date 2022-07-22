@isTest
public class EventTest {
    @isTest static void insertTest() {
        Test.startTest(); 
        Event.addNewResult('TestResult', 'a007R000010bc6nQAA', 'a017R00004AEwBCQA1', 'a027R00000qlQ1lQAE');     
        Test.stopTest(); 

        List<DemoResult__c> resultsList =[SELECT Name FROM DemoResult__c WHERE Name='TestResult' ];
        System.assertEquals(1, resultsList.size());
     
    }
        @isTest static void msgCheck(){
            Test.startTest();
            
            try{
                Event.addNewResult('TestResult', 'a007R000010bc6nQAA', 'a017R00004AEwBCQA1', 'a027R00000qlQ1lQAE');     

                Event.addNewResult('TestResult2', 'a007R000010bc6nQAA', 'a017R00004AEwBCQA1', 'a027R00000qlQ1lQAE');     
                } catch (DmlException e){
                    System.assertEquals('You\'re only allowed to vote once for each question',
                e.getMessage());
                }
                Test.stopTest(); 
            }


}
