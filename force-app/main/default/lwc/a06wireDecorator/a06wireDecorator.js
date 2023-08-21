import { LightningElement , wire } from 'lwc';
import tumAccountlarGelsin from '@salesforce/apex/AccountController.getAllAccounts'
import filtreIleAcc from'@salesforce/apex/AccountController.accountFilter'
import imperativeFiltre from'@salesforce/apex/AccountController.accountFiltreImperative'



export default class A06wireDecorator extends LightningElement {
// basit liste getirmek
    @wire(tumAccountlarGelsin) //Wiring the Output of Apex method to a property
    armut;
  

 // filtre ile  liste getirmek 1. yontem

 filtre='xxxxxx'

handleAccount(event){
this.filtre = event.target.value

}
@wire(filtreIleAcc ,{ accIsim :'$filtre'   }) 
filtreIleAccountListesi

 // filtre ile  liste getirmek 2. yontem

 filtreIki='xxxxxx'

 handleAccountIki(event){
 this.filtreIki = event.target.value
 
 }

 dataListesi
 hata

 @wire(filtreIleAcc ,{ accIsim :'$filtreIki'   }) 
 filtreIleAccountListesiIKI( {data,error}){
        if(data){
            this.dataListesi = data
            this.hata = undefined
        }else if(error){
            this.dataListesi = undefined
            this.hata = error
        }
 }

// imperative yontem ile liste getirme

filtreImerative='xxxxxx'
handleAccountImperative(event){
this.filtreImerative = event.target.value
}

imperativeListe
imperativeHata
handleAccountGetir(){
    imperativeFiltre({accIsim: this.filtreImerative})
    .then( (result) => {
       this.imperativeListe = result
       thi.imperativeHata = undefined

    }   )
    
    .catch( (error) => {
        this.imperativeListe = undefined
        this.imperativeHata = error
    } )


}



}


