def lambda_handler(event, context):
    """
    A simple AWS Lambda function that returns a success message.
    
    Args:
        event (dict): The event data passed to the Lambda function
        context (object): The runtime information of the Lambda function
    
    Returns:
        dict: A response object with statusCode and body
    """
    
    return {
        'statusCode': 200,
        'body': 'Success! The Lambda function executed successfully.'
    }