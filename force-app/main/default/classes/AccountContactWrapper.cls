public with sharing class AccountContactWrapper {



    @AuraEnabled(cacheable=true)
    public static List<account> tumAccountlarGetir3(String accIsim){
       
       // 3. method
        // SELECT id , name from account where name like '%A%'
        
       string acc ='\'%'+accIsim+'%\'' ;
       string sorgu = 'SELECT id,name FROM account WHERE name LIKE ' + acc; 
       // string sorgu = 'SELECT id,name FROM account WHERE name LIKE \'%'+ accIsim +'%\' ';  
        
       system.debug(sorgu);

      return database.query(sorgu);
       
       
   }
       @AuraEnabled(cacheable=true)
    public static List<AccountContactListWrapper> getAllAccountWithContact(String accIsim){
        
        List<AccountContactListWrapper> accConWrapperList = new List<AccountContactListWrapper>();
        List<Account> accList = [SELECT Id, Name, (SELECT Id, Name, FirstName, LastName, Email, MobilePhone FROM Contacts)
                                FROM Account];
        
         string accAra ='\'%'+accIsim+'%\'' ;
      String query = 'SELECT Id, Name, (SELECT Id, Name, FirstName, LastName, Email, MobilePhone FROM Contacts) FROM Account WHERE Name LIKE '+ accAra;
      List<Account> accList2 = Database.query(query);
        try {
            
            if(!accList2.isEmpty()){
                for(Account acc : accList2){
                    AccountContactListWrapper accConWrapper  = new AccountContactListWrapper();
                    accConWrapper.accRecord = acc;
                    accConWrapper.contactList = acc.Contacts;
                    accConWrapper.contactCount = acc.Contacts.size();
                    accConWrapperList.add(accConWrapper);
                }
            }

            return accConWrapperList;

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
   
    
    // Creating a wrapper class where I will have different sObject as its member.
    public class AccountContactListWrapper{
        @AuraEnabled
        public Account accRecord{get; set;}
        @AuraEnabled
        public List<Contact> contactList{get; set;}
        @AuraEnabled
        public Integer contactCount{get; set;}


    }
}