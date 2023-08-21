import { LightningElement } from 'lwc';

export default class A07get extends LightningElement {
    sayi1=2
    sayi2=3
toplam= this.sayi1 + this.sayi2

get toplamGet(){

   return  this.sayi1 + this.sayi2
}

isimler=['ayse','fatma','resul','ali','ertugrul']

secilenIsim = this.isimler[0]

get secilenIsimGet(){

   return this.secilenIsim 
}

girilenIndex=0
handleIndex(armut){
    this.girilenIndex = parseInt(armut.target.value)
}



secilenIsimFiltre = this.isimler[this.girilenIndex]

get secilenIsimFiltreGet(){
if(this.girilenIndex < this.isimler.length){
    return  this.isimler[this.girilenIndex]
}else{
   window.alert('buyuk rakam girdin')
}
   
    
}



}