trigger SendEmailOnContactInsert on Contact (after insert) {
    public void sendEmail(List<Contact> newContacts) {
        List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();
        
        for (Contact newContact : newContacts) {
            // Set the email message details
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setToAddresses(new List<String>{ newContact.Email });
            email.setSubject('New Contact Inserted');
            email.setPlainTextBody('A new contact has been inserted with the name: ' + newContact.FirstName + ' ' + newContact.LastName);
            emailList.add(email);
        }
        
        // Send the emails
        Messaging.sendEmail(emailList);
    }
    
    sendEmail(Trigger.new);
}