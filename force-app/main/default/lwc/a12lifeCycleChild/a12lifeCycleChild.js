import { LightningElement } from 'lwc';

export default class A12lifeCycleChild extends LightningElement {

    constructor(){
        super()
   
       // alert('CHILD Constructor')
       }
   
       connectedCallback(){
       // window.addEventListener('click',this.handleClickSayisi)
       // alert('CHILD connectedCallback()')
       throw new Error(' hata olustu')
       }
   
       handleClickSayisi(event){
        console.log('Ekrana klicklendi')
       }
      renderedCallback(){
      //  alert('CHILD  renderedCallback()')
   
      }

      disconnectedCallback(){
window.removeEventListener('click',this.handleClickSayisi)

      }
}