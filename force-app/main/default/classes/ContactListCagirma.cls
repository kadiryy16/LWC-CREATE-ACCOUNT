public class ContactListCagirma {

    public static INTEGER contactSayisi(ID accId  ){
        
    List<Contact> cntList = [SELECT AccountId, Id FROM Contact WHERE AccountId=:accId ] ;
       
        if( cntList.size()>0) {
            return   cntList.size(); 
        }else {
             return   0;
        }
     
    }
    
    public static List<Contact> contactListesi(ID accId  ){
        
    List<Contact> cntList = [SELECT AccountId, Id FROM Contact WHERE AccountId=:accId ] ;
     
            return   cntList; 
        
    }  


    
}