trigger cumartesiDersi on Account (before delete) {

      //  Bir Accountun şayet related Opportunity leri varsa o Accountun silinmesine engel olalım ve user ı uyaralım lütfen.
    // Trigger object = Account
    // DML = before delete
    // Trigger.old
                
       public static void method01(){
       
               for(Account acc : Trigger.old){
                
                List<Opportunity> oppList = [Select id, AccountId From Opportunity Where AccountId =: acc.id];
                
                if(oppList.size()>0){
                    acc.addError('Account silinemez');
                }
            } 
        }
 
    }