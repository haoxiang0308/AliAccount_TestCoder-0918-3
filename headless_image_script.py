import cv2
import numpy as np
import random
import string
import os

def generate_random_filename(ext='.jpg'):
    """Generate a random filename with the specified extension."""
    random_name = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    return f"{random_name}{ext}"

def main():
    # Create a sample image (since we don't know if a specific image exists)
    # This will be a 300x300 blue rectangle
    sample_image = np.zeros((300, 300, 3), dtype=np.uint8)
    sample_image[:, :] = [255, 0, 0]  # Blue color
    
    # Draw a white rectangle to make it more interesting
    cv2.rectangle(sample_image, (50, 50), (250, 250), (255, 255, 255), -1)
    
    # Since we can't display in headless mode, we'll skip the display functionality
    print("Image created in memory...")
    
    # Generate a random filename for saving
    random_filename = generate_random_filename('.jpg')
    
    # Save the image with the random filename
    cv2.imwrite(random_filename, sample_image)
    print(f"Image saved as: {random_filename}")
    
    # Create the Python script with OpenCV functionality and save it with a random name
    script_content = '''import cv2
import numpy as np
import random
import string

def load_display_save_image():
    # Create a simple image
    img = np.zeros((300, 300, 3), dtype=np.uint8)
    img[:, :] = [0, 255, 0]  # Green color
    
    print("Image created in memory...")
    
    # Generate random filename
    random_name = ''.join(random.choices(string.ascii_letters + string.digits, k=12))
    filename = f"{{random_name}}.jpg"
    
    # Save the image
    cv2.imwrite(filename, img)
    print(f"Image saved as: {{filename}}")

if __name__ == "__main__":
    load_display_save_image()
'''
    
    # Generate a random name for the Python script
    random_script_name = generate_random_filename('.py')
    
    # Save the script with the random name
    with open(random_script_name, 'w') as f:
        f.write(script_content)
    
    print(f"Python script saved as: {random_script_name}")

if __name__ == "__main__":
    main()