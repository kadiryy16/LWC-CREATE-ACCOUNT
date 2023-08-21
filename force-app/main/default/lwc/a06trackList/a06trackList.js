import { LightningElement, track } from 'lwc';

export default class A06trackList extends LightningElement {
@track
    cicekListesi = [

        {
            id:1,
            name:'Gul',
            familya:'DikenliGuller',
           
        } ,
        {
            id:2,
            name:'Lale',
            familya:'Lalegiller',
           
        }
        ]

cicekName=''
cicekFamilya=''
cicekId = 3

handleName(event){
   this.cicekName = event.target.value 
}

handleFamilya(event){
    this.cicekFamilya = event.target.value
}

handleClick(){
 const yeniCicek=  {
    id:this.cicekId,
    name:this.cicekName,
    familya:this.cicekFamilya
   
}

this.cicekListesi.push(yeniCicek);

this.cicekId++


}


}