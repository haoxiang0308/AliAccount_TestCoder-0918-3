def lambda_handler(event, context):
    """
    AWS Lambda function that returns a success message.
    
    Parameters:
    event (dict): The event object containing information about the request
    context (object): The context object containing runtime information
    
    Returns:
    dict: A response object with a success message
    """
    # Create a success response
    response = {
        'statusCode': 200,
        'body': {
            'message': 'Success! The Lambda function executed successfully.',
            'status': 'OK'
        },
        'headers': {
            'Content-Type': 'application/json'
        }
    }
    
    return response