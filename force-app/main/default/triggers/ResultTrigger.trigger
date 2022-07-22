trigger ResultTrigger on DemoResult__c (before insert) {
TriggerDispatcher.run(new ResultTriggerHandler());
}