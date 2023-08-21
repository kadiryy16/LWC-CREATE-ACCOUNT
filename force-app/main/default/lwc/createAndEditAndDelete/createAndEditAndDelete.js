import { LightningElement } from 'lwc';

import { createRecord } from 'lightning/uiRecordApi';
import { deleteRecord } from 'lightning/uiRecordApi';
import OPP_OBJECT from '@salesforce/schema/Opportunity';


export default class CreateAndEditAndDelete extends LightningElement {

    successMessage;
    handleSuccess2(event) { 
        this.successMessage ='New Contact has been created. ID: ' + event.detail.LastName;
    }

    successMessage2;
    handleSuccess(eve) { 
        this.successMessage2 ='New acccount has been created. ID: ' + eve.detail.Name;
    }


    successMessage3;
    handleSuccess(eve) { 
        this.successMessage3 ='contact has edited. last name:   ' + eve.detail.LastName;
    }

    successMessage4;
    handleSuccess(ev) { 
        this.successMessage4 ='New opportunity has been created last name:   ' + ev.detail.Name;
    }

    successMessage5;
    handleDeleteSuccess(ev) { 
        this.successMessage4 ='the opportunity has been deleted.. name:   ' + ev.detail.Name;
    }


}