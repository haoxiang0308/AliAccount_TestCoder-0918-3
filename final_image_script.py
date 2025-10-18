import os
import sys
from datetime import datetime
import random
import string
import numpy as np

def generate_random_filename(extension=".py"):
    """Generate a random filename with the given extension."""
    timestamp = str(datetime.now().strftime("%Y%m%d_%H%M%S"))
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
    return f"random_script_{timestamp}_{random_string}{extension}"

def load_display_save_image(image_path=None):
    """Load an image, display it (if possible), and save this script with a random name."""
    
    # Import cv2 only when needed to avoid GUI initialization issues
    import cv2
    
    # If no image is provided, create a simple test image
    if image_path is None or not os.path.exists(image_path):
        print("No image provided or image not found. Creating a test image...")
        img = np.zeros((300, 300, 3), dtype=np.uint8)
        # Create a simple pattern
        cv2.rectangle(img, (50, 50), (250, 250), (0, 255, 0), -1)  # Green square
        cv2.circle(img, (150, 150), 50, (0, 0, 255), -1)  # Red circle
        cv2.putText(img, 'Test Image', (70, 150), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)
    else:
        # Load the image from the provided path
        img = cv2.imread(image_path)
        if img is None:
            print(f"Could not load image from {image_path}")
            return
    
    # Try to display the image, but handle GUI errors gracefully
    try:
        # Check if display is available
        if os.environ.get('DISPLAY'):
            cv2.imshow('Image', img)
            print("Displaying image. Press any key to continue...")
            cv2.waitKey(0)
            cv2.destroyAllWindows()
            print("Image displayed successfully.")
        else:
            print("No display environment available. Skipping image display...")
            print("Image loaded/created successfully but not displayed due to headless environment.")
    except:
        print("Could not display image in this environment (likely headless).")
        print("Image loaded/created successfully but not displayed due to GUI limitations.")
        # Continue execution without failing
    
    # Generate a random filename for this script
    random_filename = generate_random_filename(".py")
    
    # Read the current script content
    with open(__file__, 'r') as f:
        script_content = f.read()
    
    # Write the script content to the new file with random name
    with open(random_filename, 'w') as f:
        f.write(script_content)
    
    print(f"Script saved as: {random_filename}")

if __name__ == "__main__":
    # Check if an image path was provided as an argument
    image_path = sys.argv[1] if len(sys.argv) > 1 else None
    load_display_save_image(image_path)