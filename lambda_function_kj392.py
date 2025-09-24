def lambda_handler(event, context):
    """
    A simple AWS Lambda function that returns a success message.
    """
    return {
        'statusCode': 200,
        'body': 'Success: Lambda function executed correctly!'
    }
