import json


def lambda_handler(event, context):
    """
    AWS Lambda function that returns a success message.
    
    Parameters:
    event (dict): Event data passed to the Lambda function
    context (object): Runtime information of the Lambda function
    
    Returns:
    dict: Response object with success message
    """
    # Create a success response
    response = {
        'statusCode': 200,
        'headers': {
            'Content-Type': 'application/json'
        },
        'body': json.dumps({
            'message': 'Success!',
            'status': 'completed'
        })
    }
    
    return response