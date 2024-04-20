trigger AccountReciverTri on Account (after insert) {

    set<Id> aacIdTrigger = new set<Id>();
    for(Account objacc : trigger.new){  //1,2,3
        aacIdTrigger.add(objacc.Id);
    }
    sorceReqAPITriCls.sendRecordsToTarget(aacIdTrigger); //1,2,3
 }