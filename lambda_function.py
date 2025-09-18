import json

def lambda_handler(event, context):
    # This is a simple AWS Lambda function that returns a success message
    return {
        'statusCode': 200,
        'body': json.dumps({
            'message': 'Success! The Lambda function executed successfully.',
            'status': 'success'
        })
    }