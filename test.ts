import { add } from './index';

describe('App', () => {
    it('main', () => {
        expect(add(1, 1)).toStrictEqual(2);
    })
});
