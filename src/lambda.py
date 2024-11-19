import json
import boto3

sqs = boto3.client('sqs')


def lambda_handler(event, context):
    # Your Lambda function logic here...

    message = {
        'message_body': 'Your message body',
        'message_attributes': {
            'AttributeName': {
                'DataType': 'String',
                'StringValue': 'AttributeValue'
            }
        }
    }
    response = sqs.send_message(QueueUrl=queue_url, **message)
    print(response)

    return {
        'statusCode': 200,
        'body': json.dumps('Message sent to SQS!')
    }