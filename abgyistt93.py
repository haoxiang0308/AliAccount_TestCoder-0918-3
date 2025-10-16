import cv2
import numpy as np
import random
import string

def generate_random_filename():
    """Generate a random filename with .jpg extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.jpg"

# Load an image from file
image_path = 'test_image.jpg'  # This is the image we created earlier
image = cv2.imread(image_path)

# Check if image is loaded successfully
if image is None:
    print(f"Error: Could not load image from {image_path}")
else:
    print(f"Image loaded successfully with shape: {image.shape}")

    print("Image loaded successfully (skipping display in headless environment)")
    
    # Generate a random filename for saving
    random_filename = generate_random_filename()
    
    # Save the image with the random filename
    success = cv2.imwrite(random_filename, image)
    
    if success:
        print(f"Image saved successfully as: {random_filename}")
    else:
        print(f"Failed to save image as: {random_filename}")