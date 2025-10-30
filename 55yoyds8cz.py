def lambda_handler(event, context):
    """
    AWS Lambda function that returns a success message.
    
    Parameters:
    event (dict): The event data passed to the Lambda function
    context (object): The runtime information of the Lambda function
    
    Returns:
    dict: A response object containing a success message
    """
    # Create the response object
    response = {
        'statusCode': 200,
        'body': {
            'message': 'Success! Lambda function executed successfully.'
        },
        'headers': {
            'Content-Type': 'application/json'
        }
    }
    
    return response