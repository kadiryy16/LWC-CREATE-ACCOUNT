import { LightningElement , track} from 'lwc';

export default class A07getSetParent extends LightningElement {
// primitive data transferi
yas 

    handleYas(e) {
        this.yas = e.target.value; 
    }
    @track
    customer = {
        name: 'Ali',
        yas: 25
    }

    handleName(e) {
        this.customer.name = e.target.value; 
        this.customer = { ...this.customer };
    }
    handleAge(e) {
        this.customer.yas = e.target.value; 
        this.customer = { ...this.customer };
    }
}