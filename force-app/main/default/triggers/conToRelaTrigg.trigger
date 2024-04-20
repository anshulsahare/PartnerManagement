trigger conToRelaTrigg on Contact (after insert) {
 
      if(trigger.isinsert){
        if(trigger.isAfter){
            ConRelationClass obj = new ConRelationClass();
            obj.GetConMethod(trigger.new);
        }
    }
}