import json

def lambda_handler(event, context):
    # Returns a success message
    return {
        'statusCode': 200,
        'body': json.dumps({
            'message': 'Success! The Lambda function executed successfully.',
            'status': 'success'
        })
    }