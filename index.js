// Google Cloud Function entry point
exports.helloWorld = (req, res) => {
  res.status(200).send('Hello from GCF');
};