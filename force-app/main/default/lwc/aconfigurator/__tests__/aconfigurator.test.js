import { createElement } from 'lwc';
import Aconfigurator from 'c/aconfigurator';

describe('c-aconfigurator', () => {
    afterEach(() => {
        // The jsdom instance is shared across test cases in a single file so reset the DOM
        while (document.body.firstChild) {
            document.body.removeChild(document.body.firstChild);
        }
    });

    it('displays possible answers after chosing a question', () => {
        // Arrange
        const element = createElement('c-aconfigurator', {
            is: Aconfigurator
        });

        // Act
        document.body.appendChild(element);
        const div = element.shadowRoot.querySelector('c-aconfigurator');
        expect(div).toBe(null);
          });
    });
