trigger denemeee2 on Opportunity (before update) {

  for(Opportunity opp : Trigger.new){
      if(opp.Amount < 0){
          opp.addError('Amount 0 olamaz.');
          
      }
      
            else if(opp.Amount < 10000){
                opp.Description = 'Kucuk degerli opp';
            }else if(opp.Amount < 20000){
                opp.Description = 'Orta degerli opp';
            }else {
                opp.Description = 'Buyuk degerli opp';
            }
            }
     }