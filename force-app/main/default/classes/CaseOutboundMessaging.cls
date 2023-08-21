public class CaseOutboundMessaging {

    @InvocableMethod(label='Send Case to External System')
    public static void sendCaseToExternalSystem(List<Id> caseIds) {
        List<Case> casesToSend = [SELECT Id, Subject, Description, Status, paylas__c FROM Case WHERE Id IN :caseIds AND paylas__c = true];
        
        // Verileri alacağımız URL
        String sourceUserEndpoint = 'https://yenihayat-dev-ed.develop.my.salesforce.com/services/apexrest/casesender';
        // Verileri göndereceğimiz URL
        String targetUserEndpoint = 'https://sifirdan2-dev-ed.develop.my.salesforce.com/services/apexrest/casereceiver';
        
        for (Case caseRec : casesToSend) {
            // Burada Outbound Messaging için JSON verisini hazırlayabilirsiniz.
            Map<String, Object> jsonData = new Map<String, Object>();
            jsonData.put('Id', caseRec.Id);
            jsonData.put('Subject', caseRec.Subject);
            jsonData.put('Description', caseRec.Description);
            jsonData.put('Status', caseRec.Status);
            String jsonString = JSON.serialize(jsonData);
            
            // Verileri kaynak URL'den al
            HttpRequest getRequest = new HttpRequest();
            getRequest.setEndpoint(sourceUserEndpoint);
            getRequest.setMethod('GET');
            HttpResponse getResponse = new Http().send(getRequest);
            String responseData = getResponse.getBody();
            
            // Elde edilen verileri hedef URL'ye gönder
            HttpRequest postRequest = new HttpRequest();
            postRequest.setEndpoint(targetUserEndpoint);
            postRequest.setMethod('POST');
            postRequest.setHeader('Content-Type', 'application/json');
            postRequest.setBody(responseData);
            
            // HTTP isteği gönderme
            HttpResponse postResponse = new Http().send(postRequest);
            System.debug('Response Status: ' + postResponse.getStatus());
            System.debug('Response Body: ' + postResponse.getBody());
        }
    }
}