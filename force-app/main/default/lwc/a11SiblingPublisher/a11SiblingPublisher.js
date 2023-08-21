import { LightningElement , track, wire } from 'lwc';
import { fireEvent } from 'c/pubsub'

import { CurrentPageReference } from 'lightning/navigation';



export default class A11SiblingPublisher extends LightningElement {

    @wire(CurrentPageReference)
    pageRef;

    @track
customer ={
    name:'Hasan',
    age: 35
}
handleIsim(event){
    this.customer ={

        ...this.customer,
        name:event.target.value,
        
    }
}

handleAge(event){
    this.customer ={

        ...this.customer,
        age:event.target.value,
        
    }

}


// const fireEvent = (pageRef, eventName, payload) 
    handleClick(event){

        fireEvent(this.pageRef, 'RadyoYayini', this.customer)



    }



}