def lambda_handler(event, context):
    """
    AWS Lambda function that returns a success message.
    
    Parameters:
    event (dict): The event object passed to the Lambda function.
    context (object): The context object passed to the Lambda function.
    
    Returns:
    dict: A dictionary containing the success message and status code.
    """
    # Create the response
    response = {
        'statusCode': 200,
        'body': {
            'message': 'Success! Lambda function executed successfully.',
            'status': 'OK'
        }
    }
    
    return response