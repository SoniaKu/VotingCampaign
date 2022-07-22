public abstract class TriggerHandler {
    String objectName; 
    public TriggerHandler(String sObjectName) {
        objectName=sObjectName; 
    }
     public virtual void beforeInsert(List<sObject> listNewItems) {}
//      public virtual void beforeUpdate(List<sObject> listNewItems, Map<Id,sObject> mapNewItems, List<sObject> listOldItems, Map<Id, sObject> mapOldItems) {}
//      public virtual void beforeDelete(List<sObject> listOldItems, Map<Id, sObject> mapOldItems) {}
//      public virtual void afterInsert(List<sObject> listNewItems, Map<Id, sObject> mapNewItems) {}
//      public virtual void afterUpdate(List<sObject> listNewItems, Map<Id,sObject> mapNewItems, List<sObject> listOldItems, Map<Id, sObject> mapOldItems){}
//      public virtual void afterDelete(List<sObject> listOldItems, Map<Id, sObject> mapOldItems) {}
//      public virtual void afterUndelete(List<sObject> listOldItems, Map<Id, sObject> mapOldItems) {}
 }