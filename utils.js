// A simple utility function to test
function addNumbers(a, b) {
    if (typeof a !== 'number' || typeof b !== 'number') {
        throw new Error('Both arguments must be numbers');
    }
    return a + b;
}

function capitalize(str) {
    if (typeof str !== 'string') {
        throw new Error('Argument must be a string');
    }
    return str.charAt(0).toUpperCase() + str.slice(1);
}

module.exports = {
    addNumbers,
    capitalize
};