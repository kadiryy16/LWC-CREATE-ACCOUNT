import { LightningElement, track } from 'lwc';

export default class Calisma extends LightningElement {
    @track message1;
    @track message2;
    messageHandler1(t){
    this.message1= t.target.value;
    }
    messageHandler2(eve){
    this.message2= eve.target.value;
    }
}