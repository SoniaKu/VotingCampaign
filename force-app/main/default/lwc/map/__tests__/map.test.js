import { createElement } from 'lwc';
import Map from 'c/map';

describe('c-map', () => {
    beforeEach(() => {
        const element = createElement('c-map', {
            is: Map
        });
        document.body.appendChild(element);
    });
    test('check map list length', ()=> {
        const element = document.querySelector('c-map');
        const mapDetails = element.shadowRoot.querySelectorAll('lightning-map');
        expect(mapDetails.length).toBe(1);
    })
});