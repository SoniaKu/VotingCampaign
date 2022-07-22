@isTest
public with sharing class ReportLogicTest {
    @isTest static void ReportLogicTest() {
        test.startTest(); 
            ReportLogic testLogic = new ReportLogic(); 
            Map < String, Decimal > testListBefore = ReportLogic.getResultsByQuestions('a017R00004AEwBCQA1');
            Integer listSizeBefore = testListBefore.size();   
            Event.addNewResult('TestResult', 'a007R000010bc6nQAA', 'a017R00004AEwBCQA1', 'a027R00000qlQ1lQAE');     
        Test.stopTest(); 
            Map < String, Decimal > testListAfter = ReportLogic.getResultsByQuestions('a017R00004AEwBCQA1');
            Integer listSizeAfter = testListAfter.size();           
            System.assert((listSizeBefore +1) == listSizeAfter);

    }
}
