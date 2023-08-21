import { LightningElement } from 'lwc';

export default class A02DataBinding extends LightningElement {


isim ='HASAN'


ad='Pakize'

handleIsim(event){

this.ad= event.target.value

}
 

fullIsim = "ggg"

ilkIsim='';

handleFirstName(event){
this.ilkIsim = event.target.value

}

sonIsim = '';

handleLastName(event){

this.sonIsim = event.target.value

}

get tumIsim(){

this.fullIsim = this.ilkIsim + ' ' + this.sonIsim.toUpperCase()

return  this.fullIsim     
}




sayi1

handleNum1(event){
this.sayi1 = event.target.value

}

sayi2=0
kiraz(karpu){

this.sayi2 = karpu.target.value

}

sayiToplam=0
get toplam(){

this.sayiToplam = parseInt(this.sayi1 )  + parseInt(this.sayi2 ) 
    return this.sayiToplam
}

}