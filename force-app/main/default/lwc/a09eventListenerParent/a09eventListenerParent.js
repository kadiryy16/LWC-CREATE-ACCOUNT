import { LightningElement } from 'lwc';

export default class A09eventListenerParent extends LightningElement {
// HTM listener
    clickSayisi=0
    handleClick(){
this.clickSayisi++
    }


    // JS listener


renderedCallback(){
 this.template.querySelector('c-a09event-js')
 .addEventListener('click',  this.handleClickFromChild)

}

handleClickFromChild(){

alert('bu alarm child comp deki dugmeye basildigi icin calisti')
window.alert( 'bu da window alert ile olustu')
}

}