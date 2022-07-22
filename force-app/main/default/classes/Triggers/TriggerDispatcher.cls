public class TriggerDispatcher {
    public static void run(TriggerHandler handler){
        if(Trigger.isBefore){
            if(Trigger.isInsert){
                handler.beforeInsert(Trigger.new);
            // } else if (Trigger.isUpdate) {
            //     handler.beforeUpdate(Trigger.new, Trigger.newMap, Trigger.old, Trigger.oldMap);
            //         } else {
            //             handler.beforeDelete(Trigger.old, Trigger.oldMap);
            //         }
        // } else {
        //     if(Trigger.isInsert){
        //         handler.afterInsert(Trigger.new, Trigger.newMap);
        //     } else if (Trigger.isUpdate) {
        //         handler.afterUpdate(Trigger.new, Trigger.newMap, Trigger.old, Trigger.oldMap);
        //             } else if (Trigger.isDelete){
        //                 handler.afterDelete(Trigger.old, Trigger.oldMap);
        //                     } else {
        //                         handler.afterUndelete(Trigger.old, Trigger.oldMap);
                             }
    }

}
}