public without sharing class ReportLogic {
   
    @AuraEnabled(cacheable = true)
     public static Map < String, Decimal > getResultsByQuestions(String questionId) {
        List <AggregateResult> countedVotes = [SELECT Count(Name) votesAmount, DemoAnswer__r.Name answers FROM DemoResult__c WHERE DemoQuestion__c =:questionId GROUP BY DemoAnswer__r.Name ];
        Map <String, Decimal> wrap = new Map < String, Decimal > ();

        for (AggregateResult voteStatistic: countedVotes) {
            wrap.put(String.valueOf(voteStatistic.get('answers')), (Decimal) voteStatistic.get('votesAmount'));
        }
        
        return wrap;
    }
}