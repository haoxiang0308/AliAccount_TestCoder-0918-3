import cv2
import numpy as np
import os
import random
import string

def generate_random_filename(extension=".py"):
    """Generate a random filename with the given extension."""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}{extension}"

def load_display_save_image(image_path=None):
    """
    Load an image, display it (if possible), and save this script with a random name.
    
    If no image path is provided, creates a simple test image.
    """
    # If no image path provided, create a simple test image
    if image_path is None or not os.path.exists(image_path):
        print("No image provided or found. Creating a test image...")
        # Create a simple test image (300x300 with a colored rectangle)
        img = np.zeros((300, 300, 3), dtype=np.uint8)
        img[50:250, 50:250] = (0, 255, 0)  # Green square
        image_path = "test_image.jpg"
        cv2.imwrite(image_path, img)
        print(f"Created test image: {image_path}")
    else:
        # Load the image
        img = cv2.imread(image_path)
        
        if img is None:
            print(f"Could not load image from {image_path}")
            return
    
    # Check if we're in a headless environment and skip display if so
    import os
    if os.environ.get('DISPLAY'):
        # We have a display, try to show the image
        try:
            cv2.imshow('Image', img)
            print("Displaying image. Press any key to close the window and continue...")
            cv2.waitKey(0)
            cv2.destroyAllWindows()
        except cv2.error as e:
            print(f"Could not display image: {e}")
            print("Image loaded successfully but not displayed due to display limitations.")
    else:
        print("Running in headless environment, skipping image display.")
        print("Image loaded successfully but not displayed due to lack of display server.")
    
    # Read the content of this script
    with open(__file__, 'r') as f:
        script_content = f.read()
    
    # Generate a random filename with .py extension
    random_filename = generate_random_filename(".py")
    
    # Save the script with the random filename
    with open(random_filename, 'w') as f:
        f.write(script_content)
    
    print(f"Script saved as: {random_filename}")

if __name__ == "__main__":
    # You can specify an image path here, or leave it as None to use a generated test image
    load_display_save_image()  # Change to load_display_save_image("your_image.jpg") to use a specific image