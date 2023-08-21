trigger AccountTrigger on Account ( before insert , before update , before delete , after insert , after update, after delete, after undelete ) {
    
  /*  
  system.debug(' BU Kod Calisti');
    system.debug('Trigger.isBefore ===>> ' + Trigger.isBefore);
   
    system.debug('Trigger.isAfter ===>> ' + Trigger.isAfter);
      system.debug('Trigger.isInsert ===>> ' + Trigger.isInsert);
      system.debug('Trigger.isUpdate ===>> ' + Trigger.isUpdate);
    
     system.debug('Trigger.operationType ===>> ' + Trigger.operationType);*/
    
        SWITCH on Trigger.operationType {
        
        WHEN BEFORE_INSERT  {
                         /* If an account is created 
                            No matter what The rating of account should be ‘Hot’
                            and BillingState should be ‘ARKANSAS’*/
                
                    for(Account sepet: Trigger.new){
                        sepet.rating= 'Hot';
                        sepet.BillingState = 'ARKANSAS';
                       
                    }
            /*
           Before creating an Account 
       if the industry filed is null 
        assign ‘Banking’ to Industry field
           
      
           
            for(Account acc : trigger.new){
                if( acc.Industry == null   ) {  // acc.Industry == null ===>> String.isBlank(acc.Industry)
                   acc.Industry ='Banking';
                    
                } 
                system.assertEquals(acc.name +' INSERTED, actual);
                
            }   */  
            
            for( Account acc: Trigger.new){
                acc.name= acc.name +' INSERTED';
            }
            
        }
        WHEN BEFORE_UPDATE  { 
        /* 
         Before updating an Account assign ‘Education’ to Industry field
       if rating is updated 
 
         */ /*
            
          for( Account eskiAcc : trigger.old){
              for(Account yeniAcc : trigger.new){
                                    
                    if( yeniAcc.Rating  != eskiAcc.Rating  )  {
                             yeniAcc.Industry ='Education'; 
                            }
                 } 
            }     
          for(Account yeniAcc : trigger.new){
                     
                 Account eskiHal =  trigger.oldMap.get(yeniAcc.id);
                          
                    if( yeniAcc.Rating  != eskiHal.Rating  )  {
                             yeniAcc.Industry ='Education'; 
                            }
                
            }  */
            
           /*  
            for(Account yeniHal: trigger.new ){
              Account eskiHal = trigger.oldMap.get(yeniHal.id);
                if( yeniHal.Phone != eskiHal.Phone) {
                 /*   yeniHal.Old_Phones__c =  eskiHal.Phone;
                }
            } */
            
            for( Account acc: Trigger.new){
                acc.name= acc.name +' UPDATED';
            }
        
        }
        WHEN BEFORE_DELETE  { }
        WHEN AFTER_INSERT   { 
                  /*  If an account is created  ( account name is  xxxx)
                    Create a contact related to newly created account
                    Contact name can be ‘ Contact of  xxxx */
            
            
            
           /* list<contact> kadirCnt = new list<contact>();
            for(account acc: trigger.new){
                if(acc.Name== ''){                --> eğer buradaki if şartını kaldırısak her olusturulan account un, kendi adında bir contact ı olur
                    contact newcont= new contact();
                    newcont.LastName= 'Contact of ' + acc.Name;
                    newcont.AccountId= acc.Id;
                    kadirCnt.add(newcont);
                    
                }
                
            }
          insert kadirCnt;     */
            
            
    list<contact> kadirCnt = new list<contact>();
            for(account acc: trigger.new){
                    contact newcont= new contact();
                    newcont.LastName= 'Contact of ' + acc.Name;
                    newcont.AccountId= acc.Id;
                    kadirCnt.add(newcont);
        }
          insert kadirCnt;   
         
        }
            
            
            
        WHEN AFTER_UPDATE   { }
        WHEN AFTER_DELETE   { }
        WHEN AFTER_UNDELETE {
            
 /* aşağıdaki new list yerine --> = [select Id, name from contact where accountId =: trigger.newMap.keyset()]; 
            list<contact> cntList = new    list<contact>();
            for(account acc: trigger.new){
         
            
          cntList.add([select Id, name from contact where accountId =: acc.Id]);
                    
            } */
            
            list<contact> cntList =[select Id, name from contact where accountId =: trigger.newMap.keyset()]; 
                  
            
            for(contact cnt : cntList){
                
                cnt.Description = 'vala hacı, benden söylemesi senin acc. çöpten çıktı..';
                cnt.Languages__c ='deneme için rastgele yazdırıyorum';
            }
            update cntList;
            
        }
 
    }
    
    
}