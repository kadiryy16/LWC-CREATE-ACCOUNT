trigger LeadTrigger on Lead ( before insert , before update , before delete , after insert , after update, after delete, after undelete) {

    
    SWITCH on Trigger.operationType {
        
        WHEN BEFORE_INSERT  {
          /*
           When a new Lead is created assign ‘Education’  if Industry field is null
if Lead is updated, assign ‘Banking’ if Industry field is null

           * */  
            
            
            /*
            
             for(Lead armut : trigger.new){
                    if( armut.Industry == null   ) {  // acc.Industry == null ===>> String.isBlank(acc.Industry)
                       armut.Industry ='Education';
                        
                    } */
                   for(Lead newLead : trigger.new){
                if(newLead.Industry == null ) {
                    //  newLead.addError('Kardes Industry field bos birakilamaz lutfen bir tane sec!!');  //  sayfada hata verir
                      newLead.Industry.addError('Kardes Industry field bos birakilamaz   lutfen bir tane sec!!'); // industry field da hata verir
                }     
                    
                    
                } 
        }
        WHEN BEFORE_UPDATE  {
          /*
           When a new Lead is created assign ‘Education’  if Industry field is null
      if Lead is updated, assign ‘Banking’ if Industry field is null

           * 
         for(Lead armut : trigger.new){
                        if( armut.Industry == null   ) {  // acc.Industry == null ===>> String.isBlank(acc.Industry)
                           armut.Industry ='Banking';
                            
                        }  
                        for(Lead newLead : trigger.new){
                if(newLead.Industry == null ) {
                    //  newLead.addError('Kardes Industry field bos birakilamaz lutfen bir tane sec!!');  //  sayfada hata verir
                      newLead.Industry.addError('Kardes Industry field bos birakilamaz   lutfen bir tane sec!!'); // industry field da hata verir
                } */
            
               
        }
        WHEN BEFORE_DELETE  { }
        WHEN AFTER_INSERT   { 
        
       // After creating Lead record , create a      Task. (After insert)
            List<Task> taskList = new List<Task>();
            for(Lead yeniLead: trigger.new){
             Task yenitask = new Task();
                yenitask.Subject = 'kardes yeni lead var  telefon ac';
                // yeniTask.WhatId = 'sdkjbsakj';
                yeniTask.WhoId = yeniLead.id;
                yeniTask.OwnerId = yeniLead.OwnerId;
                yeniTask.Status = '	Not Started';
                yeniTask.ActivityDate= system.today() + 3;
                taskList.add(yenitask);
            }
           insert taskList;
        }
        
        WHEN AFTER_UPDATE   { }
        WHEN AFTER_DELETE   { }
        WHEN AFTER_UNDELETE { }
 
    }
}