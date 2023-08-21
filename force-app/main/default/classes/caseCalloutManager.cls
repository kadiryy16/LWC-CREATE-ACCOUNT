public class caseCalloutManager {

   public static VOID caseListesiAllveKaydet(){
        
        Http http = new Http();
        
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
       
     //  request.setEndpoint('https://team111dev-dev-ed.develop.my.salesforce.com/services/apexrest/cases');  
     //  request.setHeader('Authorization', 'Bearer !AQgAQJUi_tXqbSKhzpChJELV93lDrHlUtIUqzc1Bf3ffIVO2lgN64KHUBxEjMIOcYv921bnA8QTXw_zcc35ZDHpTli57YjhI');
        
     request.setEndpoint('callout:SabahEkibiIleIletisim' + '/cases');  // yukardaki URL ve token yazamak yerine named credential kullanildi
       
       
        HttpResponse response =  http.send(request);
    
       system.debug(' response status code ' + response.getStatusCode());
      string responseJson = response.getBody();
   
        system.debug('responseJson ::>> ' + responseJson);
 /*
 {              "attributes":{"type":"Case","url":"/services/data/v58.0/sobjects/Case/500Ho00001DwjgiIAB"},
                "Status":"New",
                "Reason":"burasi da REASON",
                "Origin":"Web",
                "Subject":"Patch methodu calisti mi",
                "Priority":"Low",
                "Id":"500Ho00001DwjgiIAB"},

} */    
       if (response.getStatusCode() == 200  ){
           
  List<object> gelenListe =  (List<object>)JSON.deserializeUntyped(responseJson);
      
   List<Case> insertEdilecekRecordlar = new List<case>();        
           for( object obj : gelenListe    ){
               
              Map<string,Object> tekRecord=   (Map<string,Object>)obj ; 
               
               case yeniCaserecordu = new Case ();
               
               yeniCaserecordu.Subject = (string)tekRecord.get('Subject');
               yeniCaserecordu.Origin = 'Email' ;
               yeniCaserecordu.Reason =  (string)tekRecord.get('Reason');
               yeniCaserecordu.Priority =  (string)tekRecord.get('Priority');
               yeniCaserecordu.Status =  (string)tekRecord.get('Status');
             
              insertEdilecekRecordlar.add(yeniCaserecordu);
           }
           
        database.insert(insertEdilecekRecordlar);   
       }else {
           
           system.debug(' hata var kerdes ' + response.getStatusCode());
       }
    
       
       
       /*     
    List<musteriContainer> accFromJson =  (List<musteriContainer>)JSON.deserialize(musteriJson, List<musteriContainer>.class);     
    
        list< musteri__c> musteriListesi = new list< musteri__c>();
        
         For( musteriContainer mst:  accFromJson  ){
             musteri__c sonMusteri = new musteri__c();
             sonMusteri.Name = mst.name;
             sonMusteri.email__c= mst.email;
             sonMusteri.status__c= mst.status;
             sonMusteri.gender__c = mst.gender;
           musteriListesi.add( sonMusteri);
       
         }
  insert musteriListesi;
     */  
      
    }  
    
    @future(Callout=true)
    public static void sendCaseToProviderbyTrigger(){
      
         Http http=new Http();
        HttpRequest request= new HttpRequest();
 
       
        request.setMethod('POST');
        request.setEndpoint('callout:SabahEkibiIleIletisim' + '/cases');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        
        string body = '{"Subject" : "TRİGGER İLE GÖNDERDİM  from client", "Origin" :"Web"}';
        request.setBody(body);
       
        HttpResponse  response= http.send(request);
        
        system.debug(' response status code ' + response.getStatusCode());
        
        if(response.getStatusCode() ==  201 || response.getStatusCode() ==  200 ){
            
            system.debug('response  '+response.getBody());
         
        }else if (response.getStatusCode() == 302){
            
        request.setEndpoint(response.getHeader('Location'));
       HttpResponse newresponse = new Http().send(request);
            
        }else{ system.debug('Error :: ' + response.getStatusCode());} 
 
      /*     @future(Callout=true)
    public static void sendCaseToProvider(){
      
         Http http=new Http();
        HttpRequest request= new HttpRequest();
 
       
        request.setMethod('POST');
        request.setEndpoint('callout:SabahEkibiIleIletisim' + '/cases');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        
        string body = '{"Subject" : "XXXXcase from client", "Origin" :"Web"}';
        request.setBody(body);
       
        HttpResponse  response= http.send(request);
        
        system.debug(' response status code ' + response.getStatusCode());
        
        if(response.getStatusCode() ==  201 || response.getStatusCode() ==  200 ){
            
            system.debug('response  '+response.getBody());
         
        }else if (response.getStatusCode() == 302){
            
        request.setEndpoint(response.getHeader('Location'));
       HttpResponse newresponse = new Http().send(request);
            
        }else{ system.debug('Error :: ' + response.getStatusCode());} 
 
    }   
 
   public class MyCalloutClass {
@future(callout=true)
public static void sendToProvider(){
Http http = new Http();
HttpRequest req = new HttpRequest();
req.setEndpoint('callout:Sample_Named_Credentials/services/apexrest/cases/');
req.setMethod('POST');
req.setHeader('Content-Type', 'application/json;charset=UTF-8');
String body = '{"Subject" : "Case From Client", "Status":"New", "Origin":"Web", "Priority":"Low"}';
Req.setBody(body);
HTTPResponse resp = http.send(req);
if(resp.getStatusCode() == 201 || resp.getStatusCode() == 200 ) {
System.debug('response ' + resp.getBody());
}else if (resp.getStatusCode() == 302) {
Req.setEndpoint(resp.getHeader('Location'));
HttpResponse respons = new http().send(req);
}else {
system.debug('Error :: ' + resp.getStatusCode() );
}
}
}
trigger sendToProviderTrigger on Case(after insert, after update){
For(Case cs: Trigger.new){
İf(cs.insertToGoRest__c == true){
MyCalloutClass.sendToProvider();
}
}
}
sendToProviderTrigger
When  

     */
        
}
}