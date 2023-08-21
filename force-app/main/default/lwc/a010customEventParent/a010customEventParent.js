import { LightningElement } from 'lwc';

export default class A010customEventParent extends LightningElement {

    //  custome eventn BIR
    yeniBilgi=''

    handleElma(){
this.yeniBilgi=' CUSTOM EVENT OLUSTU!!!'
    }

    // custom Primitive data

    yeniBilgiPrimitive='BURASI DEGISECEK'
    handleArmut(event){
this.yeniBilgiPrimitive=event.detail

    }

// custom event OBJECT GONDERME


customer={
    name:'',
    yas:''
}
handleAyva(event){
this.customer=event.detail


}



}