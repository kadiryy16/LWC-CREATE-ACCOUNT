public class musteriCalloutClient {
    
    private static FINAL String END_POINT='https://gorest.co.in/public/v2/users';
    //@future(callout=true)
    public static VOID museriListesiAll(){
        
        Http http = new Http();
        
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('https://gorest.co.in/public/v2/users');  
       // request.setEndpoint(END_POINT + '/' + users'); --> END_POINT ile de YAZABİLİRİZ ama; yazarken noktalamaya DİKKAT ET...
        HttpResponse response =  http.send(request);
        
        
        system.debug(' response.getBody() >>>>>   ' +  response.getBody());
        /*
response.getBody() >>>>>   
[{"id":3614611,"name":"Rep. Bhaves Tagore","email":"rep_bhaves_tagore@wintheiser.test","gender":"male","status":"inactive"},
{"id":3614610,"name":"Mohana Pothuvaal","email":"pothuvaal_mohana@feeney.test","gender":"male","status":"inactive"},
{"id":3614608,"name&quo
*/
        
        system.debug('response.getHeaderKeys(); >>>>' + response.getHeaderKeys());
        /*
response.getHeaderKeys(); >>>>
(x-pagination-limit, 
x-pagination-page, Server,
x-links-previous, 
vary, 
x-frame-options, x-download-options, x-links-next, Report-To, referrer-policy, ...)
*/
        
        
        system.debug(' response.getHeader(Content-Type) >>>> ' + response.getHeader('Content-Type')); 
        // response.getHeader(Content-Type) >>>> application/json; charset=utf-8
        system.debug('response.getStatus(); >>>' + response.getStatus());  // response.getStatus(); >>>OK
        system.debug('response.getStatusCode(); >>>> '+ response.getStatusCode()); // response.getStatusCode(); >>>> 200
        
    }    
    
     public static VOID museriListesiAllveKaydet(){
        
        Http http = new Http();
        
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('https://gorest.co.in/public/v2/users');  
                         // https://gorest.co.in/public/v2/users?id=3614605
        HttpResponse response =  http.send(request);
       //  goRestten  gelen musteri listesi   response.getBody();  icindedir
         string musteriJson = response.getBody();
         //  bubody icerisinde JSON olarak gelen listeyi SObjcet DESERIALIZE ediyoruz
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
        
         /*
          *      system.debug('  accFromJson ' + accFromJson);  
        accFromJson (musteriContainer:[email=bhattathiri_laxmi@daugherty.test, gender=female, id=3614605, name=Laxmi Bhattathiri, status=inactive], 
          
*/
  /*
   *      system.debug('  accFromJson ' + accFromJson);  
    accFromJson (musteri__c:{Id=3614610, Name=Mohana Pothuvaal}, 
    musteri__c:{Id=3614606, Name=Asha Jha}, 
    musteri__c:{Id=3614605, Name=Laxmi Bhattathiri},
    musteri__c:{Id=3614604, Name=Aditya Mukhopadhyay}, 
    musteri__c:{Id=3614603, Name=Brahmabrata Chopra III},
    */
  //insert   accFromJson;   
         
    }    
    
   public static VOID tekMuseriAllveKaydet(STRING musteriId){
        
        Http http = new Http();
        
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('https://gorest.co.in/public/v2/users?id=' + musteriId);  
                         // https://gorest.co.in/public/v2/users?id=3614605
        HttpResponse response =  http.send(request);
       //  goRestten  gelen musteri listesi   response.getBody();  icindedir
         string musteriJson = response.getBody();
         //  bubody icerisinde JSON olarak gelen listeyi SObjcet DESERIALIZE ediyoruz
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
    
       
    system.debug(' kayit edilen musteri sayisi ' + musteriListesi.size() );   
         
    }    
 
  
    public static VOID filtreIleAlveKaydet(STRING musteriName , string musteriGender){
        
        Http http = new Http();
        
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('https://gorest.co.in/public/v2/users?name=' + musteriName+'&gender='+musteriGender);  
                          // https://gorest.co.in/public/v2/users?name=Laxmi&gender=female  
        HttpResponse response =  http.send(request);
       //  goRestten  gelen musteri listesi   response.getBody();  icindedir
         string musteriJson = response.getBody();
         //  bubody icerisinde JSON olarak gelen listeyi SObjcet DESERIALIZE ediyoruz
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
    
       
    system.debug(' kayit edilen musteri sayisi ' + musteriListesi.size() );   
         
    }  
    
    
     public static VOID endPointleGonder(STRING id){
        
        Http http = new Http();
        
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('https://gorest.co.in/public/v2/users/' + id);  
                         
        HttpResponse response =  http.send(request);
       //  goRestten  gelen musteri listesi   response.getBody();  icindedir
       //  
       
         if(response.getStatusCode()==200  ){
              string musteriJson = response.getBody();
         //  bubody icerisinde JSON olarak gelen listeyi SObjcet DESERIALIZE ediyoruz
         
   musteriContainer tekaccFromJson =  (musteriContainer)JSON.deserialize(musteriJson, musteriContainer.class);     
    
              musteri__c sonMusteriSon = new musteri__c();
             sonMusteriSon.Name = tekaccFromJson.name;
             sonMusteriSon.email__c= tekaccFromJson.email;
             sonMusteriSon.status__c= tekaccFromJson.status;
             sonMusteriSon.gender__c = tekaccFromJson.gender;
        insert sonMusteriSon;
    system.debug(' kayıt edilen müşteri sayısı:  ' + sonMusteriSon);
    
         }
         else {
             system.debug('problem var:  ' + response.getStatusCode());
         }
     }          
        
    
   }