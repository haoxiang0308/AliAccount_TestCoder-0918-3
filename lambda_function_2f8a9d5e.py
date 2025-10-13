def lambda_handler(event, context):
    """
    AWS Lambda function that returns a success message.
    """
    return {
        'statusCode': 200,
        'body': 'Lambda function executed successfully!'
    }
