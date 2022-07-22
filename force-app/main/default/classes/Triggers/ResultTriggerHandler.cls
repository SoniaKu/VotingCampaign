public with sharing class ResultTriggerHandler extends TriggerHandler{
    public ResultTriggerHandler(){
        super('DemoResult__c');
    }
    
    public override void beforeInsert(List<sObject> listNewItems){
        disableDoubleVoting(listNewItems); 
        
    }
    
    public  void disableDoubleVoting(List<sObject> listNewItems){
        
      
            String userID = UserInfo.getUserId();
            Map<id,DemoResult__c> demoQuestionIdsToDemoResult = new  Map<id,DemoResult__c>(); 
      
            for(DemoResult__c d : (List<DemoResult__c>)listNewItems) {
                demoQuestionIdsToDemoResult.put(d.DemoQuestion__c, d);
            }
            
            for(DemoResult__c existingAnswer: [SELECT DemoQuestion__c FROM DemoResult__c WHERE Owner.Id =:userID AND DemoQuestion__c IN :demoQuestionIdsToDemoResult.keySet() ]){
                demoQuestionIdsToDemoResult.get(existingAnswer.DemoQuestion__c).addError('You\'re only allowed to vote once for each question');   
                
            }
        
   
    }
}