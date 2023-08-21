import { LightningElement , api } from 'lwc';

export default class A07getSetChildPrimitive extends LightningElement {

@api gelenYas=0

buYas=this.gelenYas

dogumYili=2023-this.gelenYas

get dogumYiliGet(){

   return 2023-this.gelenYas
}


container
@api
get dogumYiliGetSet(){

return this.container
}

set dogumYiliGetSet(data){

    let buYil =  new Date().getFullYear();

this.container = buYil-   data
}



}