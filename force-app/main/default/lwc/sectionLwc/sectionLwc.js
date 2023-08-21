import { LightningElement ,track} from 'lwc';



export default class TodoSecondList extends LightningElement {

    handleClick(){
        this.isListReady=true
    }

isListReady=false

handleCancel(){
    this.isListReady=false
 
}

handleFinalSave() {
    this.handleCancel()
}

}