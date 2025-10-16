import json

def lambda_handler(event, context):
    """
    AWS Lambda function that returns a success message.
    
    Parameters:
    event (dict): The event data passed to the Lambda function
    context (object): The runtime information of the Lambda function
    
    Returns:
    dict: A response object with statusCode and body
    """
    # Create the response
    response = {
        'statusCode': 200,
        'body': json.dumps({
            'message': 'Success! The Lambda function executed successfully.',
            'status': 'OK'
        }),
        'headers': {
            'Content-Type': 'application/json'
        }
    }
    
    return response