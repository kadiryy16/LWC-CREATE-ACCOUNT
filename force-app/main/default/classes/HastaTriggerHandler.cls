public class HastaTriggerHandler {
    public static VOID hastaPaylas(List<Hasta__c> paslasilacakHastaListesi){
            List<Hasta__Share> eklenecekRecordlar = new List<Hasta__Share>();
            for( Hasta__c hst: paslasilacakHastaListesi   ){
               Hasta__Share paylasilacakRecord = new Hasta__Share();
                paylasilacakRecord.ParentId      = hst.id;  /// hangi record paylasilacak
                paylasilacakRecord.UserOrGroupId = hst.user__c; // hangi doktor ile paylasialcak
                paylasilacakRecord.AccessLevel = 'Edit';
                paylasilacakRecord.RowCause = 'Manual';
                eklenecekRecordlar.add(paylasilacakRecord);
            }
             for( Hasta__c hst: paslasilacakHastaListesi   ){
               Hasta__Share paylasilacakRecord = new Hasta__Share();
                paylasilacakRecord.ParentId      = hst.id;  /// hangi record paylasilacak
                paylasilacakRecord.UserOrGroupId = hst.Hemsire__c; // hangi HEMSIRE ile paylasialcak
                paylasilacakRecord.AccessLevel = 'Edit';
                paylasilacakRecord.RowCause = 'Manual';
                eklenecekRecordlar.add(paylasilacakRecord);
            }
        insert eklenecekRecordlar;
    }
    public static Hasta__Share  hastaPaylas(Id hastaninIdsi , Id paylas){
               Hasta__Share paylasilacakRecord = new Hasta__Share();
                paylasilacakRecord.ParentId      = hastaninIdsi;  /// hangi record paylasilacak
                paylasilacakRecord.UserOrGroupId = paylas; // hangi HEMSIRE ile paylasialcak
                paylasilacakRecord.AccessLevel = 'Edit';
                paylasilacakRecord.RowCause = 'Manual';
        return paylasilacakRecord;
    }
}