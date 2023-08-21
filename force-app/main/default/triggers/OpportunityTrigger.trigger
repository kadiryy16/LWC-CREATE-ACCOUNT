trigger OpportunityTrigger on Opportunity (After Update) {
   
   // [Opportunity update edildiginde bu opportunitynin accountuna, opportunity lerin accountid fieldlarindaki id leri bir set e depolayarak ulasiniz
//Daha sonra bu accountlarin aktif olup olmadiklarini kontrol ediniz
//Eger aktiflerse bunlarin yeni bir id setine depolayip, bunlarinda contactlarina bu ikinci id seti ile ulasiniz
//ulastiginiz bu contactlarin descriptionlarini update ediniz

    Set<Id> accIds = new Set<Id>();
    Set<Id> activeIds = new Set<Id>();
    
    for(Opportunity opp: Trigger.new){
        
        accIds.add(opp.accountId);
        
    }
    
	List<Account> accList = [ SELECT ID, NAME, ACTIVE__C FROM ACCOUNT WHERE ID=:accIds]   ;
    
    for(Account acc: accList){
        if(acc.active__c=='Yes'){
            activeIds.add(acc.id);
        }
        
    }
    
    List<Contact> cntList = [SELECT ID, NAME FROM CONTACT WHERE ACCOUNTID =:activeIds];
    
    List<Contact> newList = new List<Contact>();
    
    for(Contact cnt : cntList){
        
        cnt.description = 'bu oppden geldi';
        newList.add(cnt);
    }
    
    update newList;
    
}
/* Bu islem bittikten sonra tam tersine contactdan opportunitye seklinde bu islemi tekrar yaziniz
bu sefer opportunity nin description fieldina, contactin descriptionini assign ediniz  */