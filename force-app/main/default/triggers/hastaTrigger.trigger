trigger hastaTrigger on Hasta__c (before insert , before update , before delete, after insert , after update, after delete, after undelete) {

    
    SWITCH on Trigger.operationType {
        WHEN BEFORE_INSERT  { }
        WHEN BEFORE_UPDATE  { }
        WHEN BEFORE_DELETE  { }
        WHEN AFTER_INSERT   {
        List<Hasta__Share> eklenecekRecordlar = new List<Hasta__Share>();
            for( Hasta__c hst: trigger.new   ){
               Hasta__Share paylasilacakRecord = new Hasta__Share();
                paylasilacakRecord.ParentId      = hst.id;  /// hangi record paylasilacak
                paylasilacakRecord.UserOrGroupId = hst.User__c; // hangi doktor ile paylasialcak
                paylasilacakRecord.AccessLevel = 'Edit';
                paylasilacakRecord.RowCause = 'Manual';
                eklenecekRecordlar.add(paylasilacakRecord);
            }
            
            for( Hasta__c hst: trigger.new   ){
               Hasta__Share paylasilacakRecord = new Hasta__Share();
                paylasilacakRecord.ParentId      = hst.id;  /// hangi record paylasilacak
                paylasilacakRecord.UserOrGroupId = hst.hemsire__c; // hangi doktor ile paylasialcak
                paylasilacakRecord.AccessLevel = 'Edit';
                paylasilacakRecord.RowCause = 'Manual';
                eklenecekRecordlar.add(paylasilacakRecord);
            }
        insert eklenecekRecordlar;
            
                 /*  HastaTriggerHandler.hastaPaylas(trigger.new);
         List<Hasta__Share> eklenecekRecordlar = new List<Hasta__Share>();
            for( Hasta__c hst: Trigger.new   ){
               Hasta__Share   hemsireIlePaylas = HastaTriggerHandler.hastaPaylas(hst.id , hst.hemsire__c);
                eklenecekRecordlar.add(hemsireIlePaylas);
                Hasta__Share   doctorIlePaylas = HastaTriggerHandler.hastaPaylas(hst.id , hst.doctor__c);
                eklenecekRecordlar.add( doctorIlePaylas);
            }
        insert eklenecekRecordlar;
        } */
        } 
        WHEN AFTER_UPDATE   { 
         // update edildiginde yeni kisinin gormesi lazim
          List<Id> hastaIdleri = new List<Id>();
          List<Id> doktorIdleri = new List<Id>();
          List<Id> hemsireIdleri = new List<Id>();
            for( Hasta__c hst : trigger.new    ){
                hastaIdleri.add(hst.id);
                doktorIdleri.add(hst.user__c);
                hemsireIdleri.add(hst.Hemsire__c);
            }
           List< Hasta__Share> silinecekRecordlar = [ SELECT id FROM Hasta__Share WHERE   ParentId IN:  hastaIdleri
                                                       AND   (UserOrGroupId IN: doktorIdleri OR UserOrGroupId IN:hemsireIdleri )     ];
            delete silinecekRecordlar;
            List<Hasta__Share> eklenecekRecordlar = new List<Hasta__Share>();
            for( Hasta__c hst: Trigger.new   ){
               Hasta__Share   hemsireIlePaylas = HastaTriggerHandler.hastaPaylas(hst.id , hst.hemsire__c);
                eklenecekRecordlar.add(hemsireIlePaylas);
                Hasta__Share   doctorIlePaylas = HastaTriggerHandler.hastaPaylas(hst.id , hst.user__c);
                eklenecekRecordlar.add( doctorIlePaylas);
            }
            insert eklenecekRecordlar;
        }
        
        
        WHEN AFTER_DELETE   { }
        WHEN AFTER_UNDELETE { }
        }
}