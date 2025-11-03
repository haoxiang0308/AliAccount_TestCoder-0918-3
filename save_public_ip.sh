#!/bin/bash

# Initialize Terraform
terraform init

# Apply the configuration (this will get the current public IP)
terraform apply -auto-approve

# Get the public IP from Terraform output
PUBLIC_IP=$(terraform output -raw my_public_ip)

# Generate a random filename
RANDOM_FILENAME=$(mktemp --suffix=.txt)

# Save the public IP to the random filename
echo "$PUBLIC_IP" > "$RANDOM_FILENAME"

echo "Public IP ($PUBLIC_IP) saved to file: $RANDOM_FILENAME"

# Also save to a more predictable location for verification
terraform output -raw my_public_ip > "public_ip_output.txt"
echo "Public IP also saved to public_ip_output.txt for verification"