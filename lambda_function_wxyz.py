def lambda_handler(event, context):
    """
    AWS Lambda function handler that returns a success message.
    """
    return {
        'statusCode': 200,
        'body': 'Success: Lambda function executed correctly!'
    }
