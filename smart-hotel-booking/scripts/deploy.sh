#!/bin/bash

set -e

# Change this to your actual S3 bucket for SAM packaging
S3_BUCKET="your-s3-bucket-name"

echo "Deploying Lambda functions..."

cd "$(dirname "$0")/../lambdas"

for lambda in */ ; do
    cd "$lambda"
    FUNCTION_NAME=$(basename "$lambda")
    echo "Packaging $FUNCTION_NAME..."

    sam package \
        --template-file template.yml \
        --s3-bucket "$S3_BUCKET" \
        --output-template-file packaged.yml

    echo "Deploying $FUNCTION_NAME..."
    sam deploy \
        --template-file packaged.yml \
        --stack-name "$FUNCTION_NAME-stack" \
        --capabilities CAPABILITY_IAM

    cd ..
done

echo "✅ Deployment complete."
