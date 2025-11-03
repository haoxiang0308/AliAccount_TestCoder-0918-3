import json


def lambda_handler(event, context):
    """
    AWS Lambda function that returns a success message.
    
    Parameters:
    event (dict): The event data passed to the Lambda function
    context (object): The runtime information of the Lambda function
    
    Returns:
    dict: A response object with a success message
    """
    # Create a success response
    response = {
        'statusCode': 200,
        'headers': {
            'Content-Type': 'application/json'
        },
        'body': json.dumps({
            'message': 'Success! The Lambda function executed successfully.',
            'status': 'ok'
        })
    }
    
    return response


# Example usage (this would typically be handled by AWS Lambda runtime)
if __name__ == "__main__":
    # Simulate a test call
    test_event = {}
    test_context = None
    result = lambda_handler(test_event, test_context)
    print(json.dumps(result, indent=2))