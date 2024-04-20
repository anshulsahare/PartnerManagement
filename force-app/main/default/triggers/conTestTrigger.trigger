trigger conTestTrigger on Contact (after Insert, after update, after undelete, after delete) {

    if(Trigger.IsAfter && (Trigger.IsInsert || trigger.isUndelete)){
        TestConHandlerClass.getConRecord(Trigger.new);
    }
    else  if(Trigger.IsAfter && (Trigger.IsUpdate || trigger.IsDelete)){
        TestConHandlerClass.getConRecord(Trigger.old);
    }
}