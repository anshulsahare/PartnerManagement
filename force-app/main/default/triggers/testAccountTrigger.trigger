trigger testAccountTrigger on Account (Before Insert, before update) {

    if(trigger.IsBefore && (trigger.IsInsert || trigger.Isupdate)){
        testAccountTriggHandler.accMethod(trigger.new);
    }
}