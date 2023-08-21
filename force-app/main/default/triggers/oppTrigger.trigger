trigger oppTrigger on Opportunity (before insert , before update , before delete, after insert , after update, after delete, after undelete ){
    
    SWITCH on Trigger.operationType {
    WHEN AFTER_UPDATE {
            // When the Opportunity stage is updated to "Negotiation/Review"Develop a trigger that creates a TASK for the owner}
            List<Task> taskList = new List<Task>();
            for(Opportunity sonHal: trigger.new){
                Opportunity eskiHal = trigger.oldMap.get(sonHal.id);
                if( sonHal.StageName == 'Negotiation/Review'  &&  eskiHal.StageName != 'Negotiation/Review'  ){
                    Task yenitask = new Task();
                    yenitask.Subject = 'Opp son halini aldi  lutfen patrona haber ver';
                     yeniTask.WhatId = sonHal.Id ;
                  //  yeniTask.WhoId = yeniLead.id;
                    yeniTask.OwnerId = sonHal.OwnerId;
                    yeniTask.Status = '	Not Started';
                    yeniTask.ActivityDate= system.today() + 3;
                    taskList.add(yenitask);
                }
            }
            insert taskList;
        }
        
        WHEN AFTER_insert { }
            
    }
}