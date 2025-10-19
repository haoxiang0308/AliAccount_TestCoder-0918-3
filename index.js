/**
 * HTTP Cloud Function.
 *
 * @param {Object} req Cloud Function request context.
 * @param {Object} res Cloud Function response context.
 */
module.exports.helloGET = (req, res) => {
  res.status(200).send('Hello from GCF');
};