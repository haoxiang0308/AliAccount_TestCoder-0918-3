/**
 * HTTP Cloud Function that returns a simple message.
 *
 * @param {Object} req Cloud Function request context.
 * @param {Object} res Cloud Function response context.
 */
exports.helloFunction = (req, res) => {
  res.send('Hello from GCF');
};