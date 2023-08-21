trigger emailContact on Contact (after insert) {
    public void sendEmail(Set<Id> contactIds) {
        List<Contact> contacts = [SELECT Id, Name, Email FROM Contact WHERE Id IN :contactIds];
        
        List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();
        
        for (Contact con : contacts) {
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setSubject('Yeni Kişi Eklendi: ' + con.Name);
            email.setPlainTextBody('Merhaba,\n\nYeni bir kişi eklendi:\n\nAdı: ' + con.Name + '\nE-posta: ' + con.Email);
            email.setTargetObjectId(UserInfo.getUserId());
            email.setSaveAsActivity(false);
            
            emailList.add(email);
        }
        
        Messaging.sendEmail(emailList);
    }
    
    Set<Id> contactIds = new Set<Id>();
    
    for (Contact con : Trigger.new) {
        contactIds.add(con.Id);
    }
    
    sendEmail(contactIds);
   
}