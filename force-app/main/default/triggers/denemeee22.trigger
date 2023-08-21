trigger denemeee22 on Account (after update) {
            // Account her update edildiginde, Opportunity' lerinin amount fieldi 12000 olarak guncellensin

// trigger object = Account
// dml = update
// after
// trigger new  
    
    
        switch on Trigger.operationType {
        WHEN after_update   { 

         
            List<Opportunity> newList = new List<Opportunity>();
            
            for(Account acc : Trigger.new){
                List<Opportunity> oppList = [SELECT id, AccountId, amount From Opportunity Where AccountId =: acc.Id];
                
                for(Opportunity opp: oppList){
                  if(opp.Amount < 12000){
                opp.Amount = 12000;
                  }
                    else{
                        opp.Amount += 1000;
                }
                
            newList.add(opp);
            }
                update newList;     
                
    
}
    
}
 }   
}