import { LightningElement, api } from 'lwc';
import imperativeFiltre from '@salesforce/apex/AccountController.accountFiltreImperative';

export default class SilmeWireDeneme extends LightningElement {
    @api accountId; // Hesabın Id'sini dışarıdan almak için @api değişkeni kullanıyoruz.

    handleAccountSil() {
        imperativeFiltre({ accIsim: this.accountId })
            .then((result) => {
                // Hesabın başarılı bir şekilde silindiğini işaretlemek için özel bir mesajı işleyebilirsiniz.
                console.log('Hesap başarıyla silindi.');
            })
            .catch((error) => {
                // Hesabı silerken bir hata oluşursa hatayı işleyebilirsiniz.
                console.error('Hesap silme hatası:', error);
            });
    }
}


    

