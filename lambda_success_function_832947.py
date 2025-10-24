def lambda_handler(event, context):
    """
    AWS Lambda function that returns a success message.
    
    Parameters:
    event (dict): The event data passed to the Lambda function
    context (object): The runtime information of the Lambda function
    
    Returns:
    dict: A dictionary containing the success message and HTTP status code
    """
    # Create a success response
    response = {
        'statusCode': 200,
        'headers': {
            'Content-Type': 'application/json'
        },
        'body': {
            'message': 'Success! The Lambda function executed successfully.',
            'status': 'success'
        }
    }
    
    return response


# Example test event (for local testing)
if __name__ == "__main__":
    # Simulate a test event
    test_event = {}
    test_context = type('Context', (object,), {
        'function_name': 'test_function',
        'memory_limit_in_mb': 128,
        'invoked_function_arn': 'arn:aws:lambda:us-east-1:123456789012:function:test'
    })()
    
    result = lambda_handler(test_event, test_context)
    print(result)