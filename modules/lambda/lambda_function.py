import os
import json
from slack_sdk import WebClient
from slack_sdk.errors import SlackApiError

def lambda_handler(event, context):
    payload = json.loads(event['Records'][0]['Sns']['Message'])
    title = payload['AlarmName']
    description = payload['AlarmDescription']
    reason = payload['NewStateReason']

    slack_client = WebClient(token=os.environ['SLACK_TOKEN'])

    init_attachment = [
        {
            "mrkdwn_in": ["text"],
            "color": "#FF0000",
            "title": f"{title}\n",
            "fields": [
                {
                    "title": f"{description}\n",
                    "value": reason,
                    "short": False
                }
            ]
        }
    ]

    try:
        slack_client.chat_postMessage(
            channel="#YOUR_SLACK_CHANNEL",
            attachments=init_attachment,
            text=":alert: You got an alarm. \n"
        )
    except SlackApiError as e: 
        print(f"Error posting message: {e}")