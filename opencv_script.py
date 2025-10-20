import cv2
import numpy as np
import random
import string

def load_display_and_save_image():
    # Load an image from file
    image = cv2.imread('/workspace/test_image.jpg')
    
    if image is None:
        print("Error: Could not load image.")
        return
    
    print("Image loaded successfully!")
    print(f"Image shape: {image.shape}")
    
    # Note: Display is skipped in headless environment
    print("Image display skipped in headless environment")
    
    # Generate a random filename
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    random_filename = f"{random_name}.jpg"
    
    # Save the image with the random filename
    success = cv2.imwrite(random_filename, image)
    
    if success:
        print(f"Image saved successfully as {random_filename}")
    else:
        print("Error: Could not save image.")

if __name__ == "__main__":
    load_display_and_save_image()