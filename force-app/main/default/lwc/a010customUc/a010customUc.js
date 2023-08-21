import { LightningElement } from 'lwc';

export default class A010customUc extends LightningElement {

    musteri={
        name:'hatice',
        yas:37
    }
    
    handleClick(){
        const cstEvent= new CustomEvent('ayva' ,{detail: this.musteri } )
        this.dispatchEvent(cstEvent )
        
        //this.dispatchEvent(new CustomEvent('elma') )
        
            }
        


}