import { LightningElement } from 'lwc';

export default class A010customeChildBir extends LightningElement {


    handleClick(){
const cstEvent= new CustomEvent('elma')
this.dispatchEvent(cstEvent )

//this.dispatchEvent(new CustomEvent('elma') )

    }


}