import { LightningElement } from 'lwc';

export default class A010customChildIki extends LightningElement {

childdanBilgi='burasi childdan gelen bilgi'
    handleClick(){
        const cstEvent= new CustomEvent('armut' ,{detail: this.childdanBilgi } )
        this.dispatchEvent(cstEvent )
        
        //this.dispatchEvent(new CustomEvent('elma') )
        
            }
        


}