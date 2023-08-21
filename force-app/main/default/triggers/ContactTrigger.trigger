trigger ContactTrigger on Contact (before insert , before update , before delete , after insert , after update, after delete, after undelete ) {

    
    SWITCH on Trigger.operationType {
        
        WHEN BEFORE_INSERT  {
                             //get all email in the list
                    List<Messaging.SingleEmailMessage> mails =  new List<Messaging.SingleEmailMessage>();
                    for (Contact myContact : Trigger.new) {
                    if (myContact.Email != null && myContact.FirstName != null) {
                    // Step 1: Create a new Email
                    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                    // Step 2: Set list of people who should get the email
                    List<String> sendTo = new List<String>();
                    sendTo.add(  myContact.Email  );
                    sendTo.add('russellhigh03@gmail.com');
                    mail.setToAddresses(sendTo);
                    // Step 3. Set email contents - you can use variables!
                    mail.setSubject('Your contact detail are added'); //Subject of the mail and the body of the mail
                    String body = 'Dear ' + myContact.FirstName + ', ';
                    body += 'According to the ContactEmailTrigger trigger';
                    body += 'your contact details were added successful';
                    body += 'For more details you can visit ';
                    body += ' https://salesforceforfresher.wordpress.com/ ';
                    mail.setHtmlBody(body);
                    // Step 4. Add your email to the master list
                   mails.add(mail);
                    }
               }
                    // Step 5: Send all emails in the master list
              Messaging.sendEmail(mails);
        }
      
        WHEN BEFORE_UPDATE  {  }
        WHEN BEFORE_DELETE  { }
        WHEN AFTER_INSERT   {
        // Number_Of_Contacts__c
            
           SET<id> contaklarinAccIdleri = new Set<id>(); 
            
            for( Contact cnt: trigger.new){
                
                if(cnt.AccountId != null ){
                    
                    contaklarinAccIdleri.add(cnt.AccountId);
                 
                }
                
            }
        
        List<Account> contAccountlari = [SELECT id,Number_Of_Contacts__c,(SELECT id FROM contacts) FROM account WHERE ID=:contaklarinAccIdleri];    
            //data tipi  text ( string) olarak olusturulan Number_Of_Contacts__c 
                    //fieldina bir rakam (contAccountu.contacts.size()) assign ederseniz problem cikar
                    //contAccountu.Number_Of_Contacts__c= contAccountu.contacts.size();
                 
        //  contAccountu.Number_Of_Contacts__c=  string.valueOf(contAccountu.contacts.size()); 
            
            for(Account acc: contAccountlari){
                
                
            }
            
            update contAccountlari;
            
            
        }
        WHEN AFTER_UPDATE   {  }
        WHEN AFTER_DELETE   { 
        
        // Number_Of_Contacts__c
            
           SET<id> contaklarinAccIdleri = new Set<id>(); 
            
            for( Contact cnt: trigger.OLD){
                
                if(cnt.AccountId != null ){
                    
                    contaklarinAccIdleri.add(cnt.AccountId);
                 
                }
                
            }
        
        List<Account> contAccountlari = [SELECT id,Number_Of_Contacts__c,(SELECT id FROM contacts) FROM account WHERE ID=:contaklarinAccIdleri];    
            //data tipi  text ( string) olarak olusturulan Number_Of_Contacts__c 
                    //fieldina bir rakam (contAccountu.contacts.size()) assign ederseniz problem cikar
                    //contAccountu.Number_Of_Contacts__c= contAccountu.contacts.size();
                 
        //  contAccountu.Number_Of_Contacts__c=  string.valueOf(contAccountu.contacts.size()); 
            
            for(Account acc: contAccountlari){
                
               
            }
            
            update contAccountlari;
            
            
        
        }
        WHEN AFTER_UNDELETE { }
        
        }
    
    
}