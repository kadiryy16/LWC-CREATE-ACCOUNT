import { LightningElement , wire } from 'lwc';
import {registerListener,  unregisterAllListeners } from 'c/pubsub'
import { CurrentPageReference } from 'lightning/navigation';


export default class A11siblingReciver extends LightningElement {

// const registerListener = (eventName, callback, thisArg)
// const unregisterAllListeners = thisArg

@wire(CurrentPageReference)
pageRef;

connectedCallback(){
    registerListener('RadyoYayini', this.handleRadyoYayini, this)

}

newCustomer={
name:'',
age:0
}

ikicitask={
    name:'',
    age:0 
}
handleRadyoYayini(detail){

alert( detail.name +  ' abi .  nasil duygulandik ama   cok guzel sarki')
// birinci task  
this.newCustomer= detail
  
  // ikici task
   let container ={...detail}
  console.log("costomer name" + container.name )


  
   container.name = container.name.toUpperCase()
   container.age=container.age-5
this.ikicitask = container
}


disconnectedCallback(){
    unregisterAllListeners(this)
}




}