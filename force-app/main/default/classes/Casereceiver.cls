@RestResource(urlMapping='/casereceiver/*')
global class Casereceiver {
    
    @HttpPost
    global static void createCaseFromExternalSystem() {
        RestRequest request = RestContext.request;
        String requestBody = request.requestBody.toString();
        
        // Gelen JSON verisini parse edin
        Map<String, Object> jsonData = (Map<String, Object>) JSON.deserializeUntyped(requestBody);
        
        // Case objesi için gerekli alanları alın
        String subject = (String) jsonData.get('Subject');
        String description = (String) jsonData.get('Description');
        String status = (String) jsonData.get('Status');
        
        // Case objesini oluşturun ve verileri kaydedin
        Case newCase = new Case();
        newCase.Subject = subject;
        newCase.Description = description;
        newCase.Status = status;
        insert newCase;
    }
}