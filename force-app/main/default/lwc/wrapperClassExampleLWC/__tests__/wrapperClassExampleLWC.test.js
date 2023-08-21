import { createElement } from 'lwc';
import WrapperClassExampleLWC from 'c/wrapperClassExampleLWC';
import { registerApexTestWireAdapter } from '@salesforce/sfdx-lwc-jest';
import getAllAccountWithContact from '@salesforce/apex/AccountContactWrapper.getAllAccountWithContact';

const getAllAccountWithContactAdapter = registerApexTestWireAdapter(getAllAccountWithContact);


describe('c-wrapper-class-example-lwc', () => {
    afterEach(() => {
        // The jsdom instance is shared across test cases in a single file so reset the DOM
        while (getAllAccountWithContactAdapter.getLastConfig()) {
            getAllAccountWithContactAdapter.getLastConfig().onError('Cleanup');
        }
    });
    function flushPromises() {
        return new Promise(setImmediate)
      }
    it('fetches accounts with contacts on button click', async () => {
        const element = createElement('c-wrapper-class-example-lwc', {
            is: WrapperClassExampleLWC
        });

        document.body.appendChild(element);

        const inputEl = element.shadowRoot.querySelector('lightning-input');
        inputEl.value = 'Test Account';
        inputEl.dispatchEvent(new CustomEvent('blur'));

        const buttonEl = element.shadowRoot.querySelector('lightning-button');
        buttonEl.dispatchEvent(new CustomEvent('click'));

        const mockData = [
            {
                accRecord: { Id: '001XXXXXXXXXXXXXXX', Name: 'Test Account' },
                contactList: [
                    {
                        Id: '003XXXXXXXXXXXXXXX',
                        Name: 'Test Contact',
                        FirstName: 'Test',
                        LastName: 'Contact',
                        Email: 'test@test.com',
                        MobilePhone: '1234567890'
                    }
                ],
                contactCount: 1
            }
        ];
        getAllAccountWithContactAdapter.emit(mockData);

        await flushPromises;

        const accountNameEl = element.shadowRoot.querySelector('.xxx u');
        expect(accountNameEl.textContent).toBe('Test Account');

        const contactNameEl = element.shadowRoot.querySelector('.yyy');
        expect(contactNameEl.textContent).toBe('Contact Name: Test Contact');
    
    });
});
