import { LightningElement } from 'lwc';

export default class A081eventExample extends LightningElement {

    xCoordinate
    yCoordinate

    handleMouse(event){
     this.xCoordinate=  event.clientX
     this.yCoordinate = event.clientY
    }

}