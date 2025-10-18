import cv2
import numpy as np
import os
import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def main():
    # Load an image (using a placeholder - in a real scenario you'd have an actual image)
    # For demonstration, we'll create a simple image if no image exists
    test_image_path = "test_image.jpg"
    
    # Create a simple test image if it doesn't exist
    if not os.path.exists(test_image_path):
        # Create a simple colored image for testing
        test_img = np.zeros((300, 300, 3), dtype=np.uint8)
        test_img[:] = [255, 100, 50]  # Blue, Green, Red
        cv2.imwrite(test_image_path, test_img)
        print(f"Created test image: {test_image_path}")
    
    # Load the image
    image = cv2.imread(test_image_path)
    
    if image is None:
        print(f"Error: Could not load image from {test_image_path}")
        return
    
    # Print image information instead of displaying in a window
    print(f"Image loaded successfully with shape: {image.shape}")
    
    # Generate a random filename
    random_script_name = generate_random_filename()
    
    print(f"This script would save itself as: {random_script_name}")

if __name__ == "__main__":
    main()
