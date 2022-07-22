public with sharing class CampaignTriggerHandler extends TriggerHandler {
    public CampaignTriggerHandler() {
            super('DemoCampaign__c');
        }
        
        public override void beforeInsert(List<sObject> listNewItems){
            disableDuplicateNames(listNewItems); 
            
        }
        
        public  void disableDuplicateNames(List<sObject> listNewItems){
            List<String> campaignNames = new List<String>(); 
            for(DemoCampaign__c everyCamp : [SELECT Name FROM DemoCampaign__c]){
                campaignNames.add(everyCamp.Name); 
            }


            for(DemoCampaign__c camp :(List<DemoCampaign__c>)listNewItems){
                if(campaignNames.contains(camp.Name)){
                    camp.addError('Campaign with this name already exists');
                }
            }
    }
}
