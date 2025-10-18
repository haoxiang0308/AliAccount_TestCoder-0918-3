def lambda_handler(event, context):
    """
    AWS Lambda function that returns a success message.
    
    Args:
        event: The event object passed to the Lambda function
        context: The context object passed to the Lambda function
        
    Returns:
        dict: A response object with a success message
    """
    return {
        'statusCode': 200,
        'body': {
            'message': 'Success! The Lambda function executed successfully.'
        },
        'headers': {
            'Content-Type': 'application/json'
        }
    }


# Example usage (this would normally be handled by AWS Lambda infrastructure)
if __name__ == "__main__":
    # Simulate a Lambda invocation
    result = lambda_handler({}, {})
    print(result)