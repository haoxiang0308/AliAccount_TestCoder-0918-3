'use strict';

module.exports.hello = async (event) => {
  return {
    statusCode: 200,
    body: JSON.stringify(
      {
        message: 'Hello from your Serverless Node.js Lambda function!',
        input: event,
      },
      null,
      2
    ),
  };
};