import { LightningElement } from 'lwc';
import { loadStyle } from 'lightning/platformResourceLoader';
import customStyles from '@salesforce/resourceUrl/comboBoxDenemeCSS';

export default class ComboBoxDeneme extends LightningElement {
    arabalarArray = [
        { 
            label: 'BMW', 
            value: 'bmw', 
            models: [
                { label: '3.16', motorOptions: ['1.6'] },
                { label: '3.20', motorOptions: ['2.0'] },
                { label: 'model X', motorOptions: ['1.3', '1.5'] },
                { label: 'model Y', motorOptions: ['1.8'] },
                { label: 'model Z', motorOptions: ['2.5', '3.0'] }
            ]
        },
        { 
            label: 'OPEL', 
            value: 'opel', 
            models: [
                { label: 'astra', motorOptions: ['2.0'] },
                { label: 'corsa', motorOptions: ['1.6'] },
                { label: 'model X', motorOptions: ['1.3', '1.5'] },
                { label: 'model Y', motorOptions: ['1.8'] },
                { label: 'model Z', motorOptions: ['2.5', '3.0'] }
            ]
        },
        { 
            label: 'TOYOTA', 
            value: 'toyota', 
            models: [
                { label: 'corolla', motorOptions: ['1.6', '2.0'] },
                { label: 'avensis', motorOptions: ['1.6', '2.0'] },
                { label: 'model X', motorOptions: ['1.3', '1.5'] },
                { label: 'model Y', motorOptions: ['1.8'] },
                { label: 'model Z', motorOptions: ['2.5', '3.0'] }
            ]
        },
    ];

    selectedCar = this.arabalarArray[0].value;
    modeller = [];
    selectedModel = '';
    selectedMotor = '';

    get carOptions() {
        return this.arabalarArray.map(araba => ({ label: araba.label, value: araba.value }));
    }

    get modelOptions() {
        return this.modeller.map(model => ({ label: model.label, value: model.label }));
    }

    get motorOptions() {
        // Seçilen modele göre uygun motor seçeneklerini al
        const selectedAraba = this.arabalarArray.find(araba => araba.value === this.selectedCar);
        const selectedModel = selectedAraba ? selectedAraba.models.find(model => model.label === this.selectedModel) : null;
        return selectedModel ? selectedModel.motorOptions.map(motor => ({ label: motor, value: motor })) : [];
    }

    handleChange(event) {
        this.selectedCar = event.detail.value;
        // Seçilen arabaya ait modelleri al
        this.arabalarArray.forEach(araba => {
            if (araba.value === this.selectedCar) {
                this.modeller = araba.models;
                this.selectedModel = ''; // Seçilen markayı değiştirdiğimizde, model seçimini sıfırlayalım
                this.selectedMotor = ''; // Seçilen markayı değiştirdiğimizde, motor seçimini sıfırlayalım
            }
        });
    }

    handleModelChange(event) {
        this.selectedModel = event.detail.value;
    }

    handleMotorChange(event) {
        this.selectedMotor = event.detail.value;
        // Seçilen motor seçeneğine uygun modeli seç
        const selectedAraba = this.arabalarArray.find(araba => araba.value === this.selectedCar);
        if (selectedAraba) {
            const selectedModel = selectedAraba.models.find(model => model.motorOptions.includes(this.selectedMotor));
            if (selectedModel) {
                this.selectedModel = selectedModel.label;
            }
        }
    }

    connectedCallback() {
        // Stil dosyasını sayfa yüklendiğinde yükle
        Promise.all([
            loadStyle(this, customStyles)
        ]).catch(error => {
            // Hata yönetimi burada yapılabilir
            console.error('Stil dosyası yüklenirken hata oluştu: ', error);
        });
    }
}

