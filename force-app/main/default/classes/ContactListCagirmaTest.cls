@isTest
public class ContactListCagirmaTest {
   
    /*
    @isTest(SeeAllData=true)   //  (SeeAllData=true)   gercek canli database baglanma izni verir
    static VOID contactSayisiTestDATABASE_BAGLANTILI(){
        
    ACCOUNT acc=    [SELECT id FROM account WHERE name='sForce' ];
        
     INTEGER sonuc=   ContactListCagirma.contactSayisi(acc.id );
        
        system.assertEquals(2, sonuc);
          
    }
    */
    
   @isTest
    static VOID contactSayisiTest(){
    // ikinci yontem  test methodunun icinde data olusturmaktir.    
     Account acc = new Account ();
            acc.Name='armut';
            insert acc;
        
     contact cnt = new Contact();
        cnt.LastName = 'Test contact';
        cnt.AccountId= acc.id;
        insert cnt;
        
     INTEGER sonuc=   ContactListCagirma.contactSayisi(acc.id );
      
        //  account trigger 1 adet contact olusturyor  bu yuzden beklenen deger 2 oldu
        system.assertEquals( 2 , sonuc);
          
    } 
  
   @isTest
    static void contListOfAccount(){
        
        Account acc = new Account();
        	acc.Name = 'Test Account1';
        	acc.Phone = '12345';
        	insert acc;
        
        Contact cnt1 = new Contact();
        	cnt1.LastName = 'Test Contact1';
        	cnt1.AccountId = acc.Id;
        	insert cnt1;
        
        Contact cnt2 = new Contact();
        	cnt2.LastName = 'Test Contact2';
        	cnt2.AccountId = acc.Id;
        	insert cnt2;
        
        List<Contact> cntList = ContactListCagirma.contactListesi (acc.Id);
        
        System.assertEquals(3, cntList.size());
system.assertEquals(acc.id, cntList[0].AccountId);
    } 
    
    
    
    
}