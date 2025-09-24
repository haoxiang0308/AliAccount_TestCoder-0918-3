#!/bin/bash
# Script to get current user information

echo "Current User Information:"
echo "Username: $USER"
echo "User ID: $(id -u)"
echo "Group ID: $(id -g)"
echo "Home Directory: $HOME"
echo "Current Shell: $SHELL"