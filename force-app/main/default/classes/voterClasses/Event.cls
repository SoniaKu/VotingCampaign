public class Event{
    @AuraEnabled()
      public static void addNewResult(String Name, String Campaign, String Question, String Answer){
        String msg = '';
        try {
            DemoResult__c result = new DemoResult__c();
            result.Name = Name; 
            result.DemoCampaign_del__c = Campaign; 
            result.DemoQuestion__c = Question;
            result.DemoAnswer__c = Answer; 
            insert result;

        }catch(DmlException e){
        
            for (Integer i = 0; i < e.getNumDml(); i++) {
                
                msg =+ e.getDmlMessage(i) +  '\n' ;
            }
            
            throw new AuraHandledException(msg);
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        
    }
    
}