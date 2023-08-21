trigger homework2Account on Account (before insert,after update) {
    switch on Trigger.operationType {
        when BEFORE_INSERT { 
            Set<Id> accountOwnerIds = new Set<Id>();
            for (Account acc : Trigger.new) {
                accountOwnerIds.add(acc.OwnerId);
            }
            
            Map<Id, User> usersMap = new Map<Id, User>([SELECT Id, Name FROM User WHERE Id IN :accountOwnerIds]);
            for (Account acc : Trigger.new) {
                if (usersMap.containsKey(acc.OwnerId)) {
                    acc.Sales_Repr__c = usersMap.get(acc.OwnerId).Name;
                }
            }
        }
        
        when after_UPDATE {
    List<Account> accountsToUpdate = new List<Account>();
    
    for (Account updatedAccount : Trigger.new) {
        Account oldAccount = Trigger.oldMap.get(updatedAccount.Id);
        if (updatedAccount.OwnerId != oldAccount.OwnerId) {
            updatedAccount.Sales_Repr__c = updatedAccount.Owner.Name;
            accountsToUpdate.add(updatedAccount);
        }
    }
    
    update accountsToUpdate;
}

        }
    }

 /*
            for(Account yeniHal: trigger.new ){
              Account eskiHal = trigger.oldMap.get(yeniHal.id);
                if( yeniHal.Phone != eskiHal.Phone) {
                 /*   yeniHal.Old_Phones__c =  eskiHal.Phone;*/  /*
                }
            }
            
list<contact> cntList =[select Id, name from contact where accountId =: trigger.newMap.keyset()]; 
                  
            
            for(contact cnt : cntList){
                
                cnt.Description = 'vala hacı, benden söylemesi senin acc. çöpten çıktı..';
                cnt.Languages__c ='deneme için rastgele yazdırıyorum';
            }
            update cntList;  */
           















/*
Map<Id, User> salesRepsMap = new Map<Id, User>([SELECT Id, Name FROM User WHERE Id IN :accountOwnerIds]);
    
    for (Account acc : Trigger.new) {
        if (salesRepsMap.containsKey(acc.OwnerId)) {
            acc.Sales_Repr__c = salesRepsMap.get(acc.OwnerId).Name;
        }
    }*/