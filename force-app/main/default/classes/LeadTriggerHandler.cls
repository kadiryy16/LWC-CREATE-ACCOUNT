public class LeadTriggerHandler {

    public static void industryNotNull(list<lead> leadList){
        
         for(Lead newLead : leadList){
                if(newLead.Industry == null ) {
                    //  newLead.addError('Kardes Industry field bos birakilamaz lutfen bir tane sec!!');  //  sayfada hata verir
                      newLead.Industry.addError('Kardes Industry field bos birakilamaz   lutfen bir tane sec!!'); // industry field da hata verir
                }
            }
                        
                  
        
    }
    
}