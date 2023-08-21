import { LightningElement } from 'lwc';

export default class A082eventBubbling extends LightningElement {

    innerDiv=0
    middleDiv=0
    outerDiv=0

    handleOuterDiv(){
    this.outerDiv++

    }

    handleMiddleDiv(event){
this.middleDiv++
event.stopPropagation()
    }
    handleInnerDiv(){

this.innerDiv++

    }

}