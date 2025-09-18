#!/bin/bash

# Generate a random filename with .py extension
RANDOM_FILENAME="django_view_$(openssl rand -hex 5).py"

# Copy the view code to the random filename
cp /workspace/django_view_code.py "/workspace/$RANDOM_FILENAME"

echo "Django view saved to: $RANDOM_FILENAME"