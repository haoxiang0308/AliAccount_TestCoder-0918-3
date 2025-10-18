import cv2
import numpy as np
import random
import string
import os

def generate_random_filename():
    """Generate a random Python filename"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

# Load an image from file
image_path = 'sample.jpg'
image = cv2.imread(image_path)

# Check if image is loaded successfully
if image is None:
    print(f"Error: Could not load image from {image_path}")
else:
    print(f"Image loaded successfully with shape: {image.shape}")
    
    # Skip display in headless environment
    print("Skipping image display (headless environment)...")
    print("Image loaded in memory and ready for processing.")
    
    # Generate a random filename and save this script with that name
    random_filename = generate_random_filename()
    
    # Read the content of the current script
    with open(__file__, 'r') as f:
        script_content = f.read()
    
    # Write the script content to the new random filename
    with open(random_filename, 'w') as f:
        f.write(script_content)
    
    print(f"Script saved with random name: {random_filename}")
    
    # Optional: Show image info
    height, width, channels = image.shape
    print(f"Image dimensions: {width}x{height}, Channels: {channels}")