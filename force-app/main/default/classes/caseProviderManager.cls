@RestResource(UrlMapping='/cases/*')
global class caseProviderManager {
 /*
    system.url.getSalesforceBaseUrl()
system.debug(' salesforce URL ::::   ' + system.url.getSalesforceBaseUrl());
//  https://xxxxxxxxxxxxxx/services/apexrest
//        https://team111dev-dev-ed.develop.my.salesforce.com/services/apexrest/cases 
//           team111dev-dev-ed.develop.my.salesforce.com   //  my domainden gelen 
   */ 
 
    /* PAROLA ( token) icin session ID verecegiz
    //  session ID

System.debug(System.UserInfo.getSessionId().substring(15));

//              !AQgAQLjc5WJcfXLKtWhJEX2_Qx6QZEdLfCxxxxxxxxxxxxxzazZ.GdNpnSQidADMrkR.v_Y4
    */
    
    @HttpGet
    global static List<case> caseGetProvider(){
        
       List<case> caseList = [SELECT  Type, Status, Reason, Origin, Subject, Priority FROM case Limit 5]; 
       
        return caseList;
        
    }    
    
    
    @HttpPost
    global static case doPost(String Subject, String Origin) {
        //  not  postman veri gonderirken case obj sindeki field adi ile ayni ad ile gonderirse
        //  map yapilirken problemle karsilasilmaz
        //  degilse CONTAINER methodu ogrenmistik  o yontemle halledilir
        Case yeniCase = new Case();
        yeniCase.Subject = Subject;
        yeniCase.Status = 'New';
        yeniCase.Priority = 'Low';
        yeniCase.Origin  = Origin;
        
        insert yeniCase;
        /*
        // posman raw data kismina yapistirilan JSON
         {

        "Origin": "Web",
        "Subject": "subject degisti"

         }*/
        return yeniCase;
        
    }
    
     @HttpDelete
    global static String doDelete(){
      
        RestRequest request = RestContext.request;
        //  RestResponse res = RestContext.response;
        //  https://team111dev-dev-ed.develop.my.salesforce.com/services/apexrest/cases/500Ho00001DweA9IAJ
         String silinecekCaseId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        // silinecekCaseId    postamnden gelen URL deki silinecek caseId yi almak icin yazilan kod
        
       Case silinecekCase = [SELECT id FROM case WHERE id =: silinecekCaseId];

      delete silinecekCase;
        return  ' silmek istedgin record silindi';
    }
    
    @HttpPut
    global static case doPut(String Subject, String Origin ,string Id ) {
       
        Case yeniCase = new Case();
        
        yeniCase.Id = Id;
        yeniCase.Subject = Subject;
        yeniCase.Status = 'New';
        yeniCase.Priority = 'Low';
        yeniCase.Origin  = Origin;
        
        upsert yeniCase;
        /*
       postmanden gonderilecek JSON
         {
         "Id": "500Ho00001DweA9IAJ"
        "Origin": "Web",
        "Subject": "subject degisti"

         }*/
        return yeniCase;
        
    }
   
    
    @HttpPatch
    global Static Case doPatch(){
        
      RestRequest request = RestContext.request;
      
      String updateCaseId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
       
    Case updateEdilecekCase = [SELECT id FROM Case WHERE id=: updateCaseId];    
       
    
  Map<string,Object> gelenJson=  (Map<string,Object>)JSON.deserializeUntyped(request.requestBody.toString());        
        
        for( String fieldName : gelenJson.keySet()){
            updateEdilecekCase.put(fieldName, gelenJson.get(fieldName));
            
            
        }        
       update  updateEdilecekCase;
        
        return updateEdilecekCase;
    }
    
    
    
    
}