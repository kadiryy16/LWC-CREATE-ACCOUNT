trigger contTriggerAsyndeneme on Contact (after insert, after delete) {
// After events
if(Trigger.isafter) {
if(Trigger.isInsert) {
ContactTriggerHandler.onAfterSave(Trigger.New);
}
if(Trigger.isDelete) {
ContactTriggerHandler.onAfterSave(Trigger.Old);
}
}
}