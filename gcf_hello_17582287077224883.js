/**
 * Google Cloud Function that returns 'Hello from GCF'
 * @param {Object} req - The request object
 * @param {Object} res - The response object
 */
exports.helloGCF = (req, res) => {
  res.send('Hello from GCF');
};