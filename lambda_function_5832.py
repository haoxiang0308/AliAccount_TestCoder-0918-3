def lambda_handler(event, context):
    """
    AWS Lambda function that returns a success message.
    
    Parameters:
    event: The event data passed to the Lambda function
    context: The runtime information of the Lambda function
    
    Returns:
    dict: A dictionary containing the HTTP response
    """
    # Create a success response
    response = {
        'statusCode': 200,
        'headers': {
            'Content-Type': 'application/json'
        },
        'body': {
            'message': 'Success! The Lambda function executed successfully.',
            'status': 'ok'
        }
    }
    
    return response

# Example usage when running locally (not in AWS Lambda)
if __name__ == "__main__":
    # Simulate a test event
    test_event = {}
    test_context = type('Context', (), {'aws_request_id': 'test-id'})()
    
    result = lambda_handler(test_event, test_context)
    print(result)