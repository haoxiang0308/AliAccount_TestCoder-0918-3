/**
 * HTTP Cloud Function that returns 'Hello from GCF'
 *
 * @param {Object} req Cloud Function request context.
 * @param {Object} res Cloud Function response context.
 */
exports.helloGCF = (req, res) => {
  res.send('Hello from GCF');
};