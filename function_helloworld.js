/**
 * HTTP Cloud Function.
 *
 * @param {Object} req Cloud Function request context.
 * @param {Object} res Cloud Function response context.
 */
function helloGET (req, res) {
    res.send('Hello from GCF');
}

module.exports = helloGET;