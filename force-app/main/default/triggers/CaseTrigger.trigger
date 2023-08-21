trigger CaseTrigger on Case (after insert, after update) {
    // Yalnızca "paylas__c" alanı değiştirildiğinde tetikleyiciyi çalıştırmak için bu değişkeni kullanın.
    Boolean isPaylasFieldChanged = false;

    // Eğer kayıtlar güncellenmişse "paylas__c" alanı değiştirilip değiştirilmediğini kontrol edin.
    if (Trigger.isUpdate) {
        for (Case caseRec : Trigger.new) {
            Case oldCase = Trigger.oldMap.get(caseRec.Id);
            if (caseRec.paylas__c != oldCase.paylas__c) {
                isPaylasFieldChanged = true;
                break;
            }
        }
    }

    // Yeni kayıt oluşturulmuş veya "paylas__c" alanı değiştirilmişse, sendCaseToExternalSystem yöntemini çağırın.
    if (Trigger.isInsert || isPaylasFieldChanged) {
        List<Id> caseIdsToProcess = new List<Id>();

        // Oluşturulan veya güncellenen "Case" kayıtlarını listeleyin.
        for (Case caseRec : Trigger.new) {
            if (Trigger.isInsert || (caseRec.paylas__c && caseRec.paylas__c != Trigger.oldMap.get(caseRec.Id).paylas__c)) {
                caseIdsToProcess.add(caseRec.Id);
            }
        }

        // sendCaseToExternalSystem yöntemini çağırın.
        if (!caseIdsToProcess.isEmpty()) {
            CaseOutboundMessaging.sendCaseToExternalSystem(caseIdsToProcess);
        }
    }
}