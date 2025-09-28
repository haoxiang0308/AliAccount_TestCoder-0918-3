def lambda_handler(event, context):
    """
    A simple AWS Lambda function that returns a success message.
    """
    return {
        'statusCode': 200,
        'body': 'Hello from Lambda! The function executed successfully.'
    }

# Example event and context for local testing (optional)
if __name__ == "__main__":
    example_event = {}
    example_context = None
    print(lambda_handler(example_event, example_context))