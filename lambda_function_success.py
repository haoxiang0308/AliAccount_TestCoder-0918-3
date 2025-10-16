import json


def lambda_handler(event, context):
    """
    AWS Lambda function that returns a success message.
    
    Parameters:
    event (dict): The event object passed to the Lambda function
    context (object): The context object passed to the Lambda function
    
    Returns:
    dict: A response object with a success message
    """
    # Create the response
    response = {
        'statusCode': 200,
        'headers': {
            'Content-Type': 'application/json'
        },
        'body': json.dumps({
            'message': 'Success! The Lambda function executed successfully.',
            'status': 'OK'
        })
    }
    
    return response