import json

def lambda_handler(event, context):
    print("Generating invoice...")
    invoice = {
        "invoiceId": "INV-1001",
        "amount": 199.99,
        "status": "generated"
    }
    return {
        "statusCode": 200,
        "body": json.dumps(invoice)
    }
