import boto3
import os
import datetime

# Initialize SES client
SES_CLIENT = boto3.client('ses')

def lambda_handler(event, context):
    # Get current time
    current_time = datetime.datetime.utcnow().isoformat()

    # Get environment variables
    source_email = os.environ['SOURCE_EMAIL']
    dest_email = os.environ ['DEST_EMAIL']
    environment = os.environ.get('ENVIRONMENT', 'default')

    # Send email using SES
    response = SES_CLIENT.send_email(
        Source=source_email,  
        Destination={'ToAddresses': [dest_email]}, 
        Message={
            'Subject': {'Data': event['subject']},
            'Body': {
                'Text': {
                    'Data': f"Time: {current_time}\nEnvironment: {environment}\n\n{event['body']}"
                }
            }
        }
    )

    # Return structured response
    return {
        'statusCode': 200,
        'body': {
            'message': 'Email sent successfully',
            'time_sent': current_time,
            'environment': environment,
            'ses_response': response
        }
    }
