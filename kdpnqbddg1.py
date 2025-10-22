import json


def lambda_handler(event, context):
    """
    AWS Lambda function that returns a success message.
    
    Parameters:
    event (dict): The event dict that contains data for the event
    context (object): The context object that provides information about the invocation,
                     function, and execution environment
    """
    # Create a success response
    response = {
        "statusCode": 200,
        "headers": {
            "Content-Type": "application/json"
        },
        "body": json.dumps({
            "message": "Success! The Lambda function executed successfully.",
            "status": "success"
        })
    }
    
    return response


# Example test event (for local testing)
if __name__ == "__main__":
    # Simulate a test event
    test_event = {}
    test_context = None
    
    # Call the function
    result = lambda_handler(test_event, test_context)
    print(json.dumps(result, indent=2))