import { LightningElement } from 'lwc';
import accOlustur from '@salesforce/apex/LWCileAccountOlustur.accountOlustur'
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class A06AccountCreate extends LightningElement {
    accountName
    handleAccountName(event){
this.accountName = event.target.value

    }


    handleClick(){
        accOlustur({accName:this.accountName})
        .then((response) => { 
            if(response === 'guzelsin' ){
         
         this.dispatchEvent( new ShowToastEvent({
           title: 'TEBRIKLER MASALLAH SIZE!',
           message: 'Tebrikler bir adet accout olusturdunuz',
           variant: 'success'

         }))
   
            }else if (response == 'malesef' ){
               this.dispatchEvent( new ShowToastEvent({
                   title: 'Warning!',
                   message: 'uzgunum malesef',
                   variant: 'error'
                 }))
    
            }
   
            } )
        .catch( (error) =>{console.log('Hata Olustu')}  )
     



    }






}