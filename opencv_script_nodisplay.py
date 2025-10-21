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
    # Try to load a sample image - if it doesn't exist, we'll create a blank one
    sample_image_path = "sample_image.jpg"
    
    # Create a sample image if one doesn't exist
    if not os.path.exists(sample_image_path):
        print("Creating a sample image since none was found...")
        # Create a sample image with OpenCV
        sample_img = np.zeros((300, 300, 3), dtype=np.uint8)
        # Add some color patterns to make it interesting
        sample_img[50:150, 50:150] = [255, 0, 0]  # Blue square
        sample_img[150:250, 150:250] = [0, 255, 0]  # Green square
        sample_img[50:150, 150:250] = [0, 0, 255]  # Red square
        sample_img[150:250, 50:150] = [255, 255, 0]  # Cyan square
        
        cv2.imwrite(sample_image_path, sample_img)
        img = sample_img
        print(f"Sample image created: {sample_image_path}")
    else:
        # Load the image
        img = cv2.imread(sample_image_path)
    
    if img is None:
        print("Error: Could not load image.")
        return
    
    # Instead of displaying the image in a window, just save it to a new file
    print("Image loaded successfully!")
    print(f"Image shape: {img.shape}")
    
    # Generate a random filename and save this script with that name
    random_filename = generate_random_filename()
    
    # Read the current script content
    with open(__file__, 'r') as f:
        script_content = f.read()
    
    # Write the script content to the new random filename
    with open(random_filename, 'w') as f:
        f.write(script_content)
    
    print(f"Script saved with random filename: {random_filename}")

if __name__ == "__main__":
    main()