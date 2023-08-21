import { LightningElement,  track } from 'lwc';
import getAllAccountWithContact from '@salesforce/apex/AccountContactWrapper.getAllAccountWithContact';



export default class WrapperClassExampleLWC extends LightningElement {

    @track accountsWithContacts;
    @track myError;
    
    filtreImperative='xxxxxxxxx';
handleAccountImperative(e){
    this.filtreImperative = e.target.value
 
     }


handleClick(){
    getAllAccountWithContact({accIsim:this.filtreImperative})
    .then ( (result) => { this.accountsWithContacts = result;
                          this.myError                 = undefined     } )
    .catch(  (error) => { this.accountsWithContacts = undefined ;
                           this.myError                 = error     }    )

}  
}