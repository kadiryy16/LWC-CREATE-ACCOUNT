import { LightningElement , api} from 'lwc';

export default class A07setChildObject extends LightningElement {

container
get childCustomer(){
 return this.container
}
@api
set childCustomer(data){
    // spreat operator 1. yonem
 let geciciCustomer = {...data}
   geciciCustomer.name = geciciCustomer.name.toUpperCase() + 'abi '
   geciciCustomer.age = geciciCustomer.age - 5

 // spreat operator 2. yonem
 let geciciCustomer2 = {...data , name: data.name.toUpperCase() + ' buyuk abi ** '}

// Object.assign({} , data) yontemi
let geciciCustomer3 = Object.assign({} , data)
geciciCustomer3.name= geciciCustomer3.name +' **///**///*'


   this.container = geciciCustomer3
}

}