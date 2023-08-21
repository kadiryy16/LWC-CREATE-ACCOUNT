import { LightningElement } from 'lwc';

export default class DilekHanim extends LightningElement {

    fuelTypes = [
        { label: 'Fuel', value: 'fuel' },
        { label: 'Hybrid', value: 'hybrid' }
    ];
 fuelTypeDetails = {
        fuel: [
            { label: 'Toyota (Fuel)', value: 'toyota' },
            { label: 'Honda (Fuel)', value: 'honda' },
            
        ],
        hybrid: [
            { label: 'BMW (Hybrid)', value: 'bmw' },
            { label: 'Mercedes (Hybrid)', value: 'mercedes' },
            
        ]
    };

   selectedFuelType = '';
   selectedCarDetail = '';

    
    get carDetailOptions() {
        
        return this.selectedFuelType === 'fuel'
            ? this.fuelTypeDetails['fuel'] 
            : this.fuelTypeDetails[this.selectedFuelType];
    }

    
    handleFuelTypeChange(event) {
        this.selectedFuelType = event.detail.value;
        if (this.selectedFuelType === 'fuel') {
            this.selectedCarDetail = ''; 
        }
    }

    
    handleCarDetailChange(event) {
        this.selectedCarDetail = event.detail.value;
    }
}

