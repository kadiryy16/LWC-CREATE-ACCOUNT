public with sharing class LWCileAccountOlustur {
   
@AuraEnabled
public static string accountOlustur(String accName){
    try {
        
        Account acc = new Account();
        acc.Name=accName;
        insert acc;

        if(acc.id != null ){

        return 'guzelsin';
        }else{
            return 'malesef';
        }


    } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
    }
}



}