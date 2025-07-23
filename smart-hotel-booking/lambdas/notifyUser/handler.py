import json

def lambda_handler(event, context):
    print("Notifying user...")
    user_notification = {
        "userId": event.get("userId", "unknown"),
        "message": "Your booking has been confirmed!",
        "status": "notified"
    }
    return {
        "statusCode": 200,
        "body": json.dumps(user_notification)
    }
