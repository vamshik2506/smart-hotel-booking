#!/bin/bash

set -e

echo "Tearing down deployed Lambda stacks..."

cd "$(dirname "$0")/../lambdas"

for lambda in */ ; do
    FUNCTION_NAME=$(basename "$lambda")
    echo "Deleting stack: $FUNCTION_NAME-stack..."
    aws cloudformation delete-stack --stack-name "$FUNCTION_NAME-stack"
done

echo "🗑️ Teardown complete."
