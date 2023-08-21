public with sharing class AccountController {

  
    // basit liste getirmek
    @AuraEnabled(cacheable=true)
    public static list<Account> getAllAccounts(){
        
        List<account> accList =[SELECT id, name FROM Account WITH SECURITY_ENFORCED LIMIT 5 ];
        return accList;
        
    }

 // filtre ile  liste getirmek
@AuraEnabled(cacheable=true)
public static List<account> accountFilter( String accIsim   ){
    try {
       

        string acc ='%'+accIsim+'%' ;
   // string sorgu ='SELECT id , Name FROM Account WHERE name LIKE '+ acc +'';
     string sorgu = 'SELECT id,name FROM account WHERE name LIKE \'%'+ accIsim +'%\' ';  
    return Database.query(sorgu);

    } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
    }
}



// imperative yontem ile liste getirme

//@AuraEnabled(cacheable=true)
@AuraEnabled
public static List<account> accountFiltreImperative( String accIsim   ){
    try {
       

        string acc ='%'+accIsim+'%' ;
   // string sorgu ='SELECT id , Name FROM Account WHERE name LIKE '+ acc +'';
     string sorgu = 'SELECT id,name FROM account WHERE name LIKE \'%'+ accIsim +'%\' ';  
    return Database.query(sorgu);

    } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
    }
}




}