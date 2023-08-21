import { LightningElement } from 'lwc';

export default class A05ArabaCOMPOSITION extends LightningElement {

arabaModeli='Honda'
handleAraba(ev){
this.arabaModeli = ev.target.value

}

motorCinsiDede='TSI'
handleMotorCinsi(e){
this.motorCinsiDede = e.target.value

}

motorHacmiDede = 3.0
handleMotorHacmi(event){
this.motorHacmiDede = event.target.value

}


}