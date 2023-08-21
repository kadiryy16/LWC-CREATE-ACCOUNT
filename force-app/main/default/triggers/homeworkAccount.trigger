trigger homeworkAccount on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    
    
    switch on Trigger.operationType {
        when BEFORE_INSERT {
            for (Account newAcc : Trigger.new) {
        if (newAcc.BillingCity != null && newAcc.ShippingCity == null) {
            newAcc.ShippingCity = newAcc.BillingCity;
        }
        }
        }
        when BEFORE_UPDATE {}
        when BEFORE_DELETE { }
        when AFTER_INSERT { }
        when AFTER_UPDATE {
        
 
    List<Contact> contactYenileme = new List<Contact>();
    
       for (Account yeniAcc : Trigger.new) {
        Account eskiAcc = Trigger.oldMap.get(yeniAcc.Id);
        
        if (yeniAcc.BillingCity != eskiAcc.BillingCity) {
            List<Contact> accCont = [SELECT Id, MailingCity FROM Contact WHERE AccountId = :yeniAcc.Id];
            
            for (Contact yeniCnt : accCont) {
                yeniCnt.MailingCity = eskiAcc.BillingCity;
                contactYenileme.add(yeniCnt);
            }
        }
    }
    
    
        update contactYenileme;
    
    
 
    }   
   
        when AFTER_DELETE {}
        when AFTER_UNDELETE {}
   
}

}