import { LightningElement, api, track } from 'lwc';

export default class A06trackDecoratorObject extends LightningElement {


 
@track
   fullIsim = {
    name: 'hatice',
    age:9
   }

@api ad='Pakize'
@api soyad='guzel'

   handleIsim(event){
    
    this.ad= event.target.value
   this.fullIsim.name= event.target.value
    }


    handleSoyIsim(event){

        this.soyad = event.target.value
       // this.fullIsim.age = event.target.value
    }

    handleAge(event){
        this.fullIsim.age = event.target.value
    }

  

   

}