import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import { LightningElement, wire } from 'lwc';
import Id from '@salesforce/user/Id';
import UserName from '@salesforce/schema/User.Name';
import UserEmailFld from '@salesforce/schema/User.Email';

//const fields =[UserName,UserEmailFld];
export default class A13getUserDetails extends LightningElement {


userId=Id;



currentUserName;
currentUserEmail;
error;

//@wire(getRecord,{recordId:'$userId',fields}) 
@wire(getRecord,{recordId:'$userId',fields:[UserName,UserEmailFld]}) 
userInfo({error,data}){
    if(data){
     this.currentUserName= data.fields.Name.value;
     this.currentUserEmail = data.fields.Email.value
    }else{
        this.error = error;
    }
}
/*
get name(){
   return getFieldValue(this.userInfo.data , UserName) 
}

get email(){
    return getFieldValue(this.userInfo.data , UserEmailFld) 
 }
 */
}