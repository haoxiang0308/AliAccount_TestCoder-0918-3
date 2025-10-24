import cv2
import numpy as np
import random
import string
import os

def generate_random_filename(extension='.py'):
    """Generate a random filename with the given extension."""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return random_name + extension

def main():
    # Load an image from file
    image_path = 'test_image.jpg'  # Using the test image we created
    
    # Check if the image exists
    if not os.path.exists(image_path):
        print(f"Error: {image_path} not found!")
        return
    
    # Load the image using OpenCV
    image = cv2.imread(image_path)
    
    # Check if the image was loaded successfully
    if image is None:
        print(f"Error: Could not load image from {image_path}")
        return
    
    print(f"Image loaded successfully. Shape: {image.shape}")
    
    # Note: Display is skipped in headless environments
    print("Image loaded but not displayed (headless environment)")
    
    # Generate a random filename for the script
    random_filename = generate_random_filename('.py')
    
    # Save this script with the random filename
    with open(__file__, 'r') as original_file:
        script_content = original_file.read()
    
    with open(random_filename, 'w') as new_file:
        new_file.write(script_content)
    
    print(f"Script saved with random filename: {random_filename}")

if __name__ == "__main__":
    main()