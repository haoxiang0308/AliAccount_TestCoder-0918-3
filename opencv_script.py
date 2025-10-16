import cv2
import numpy as np
import os
import random
import string

def generate_random_filename(extension='.py'):
    """Generate a random filename with the given extension."""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return random_name + extension

def load_display_save_image(image_path='sample_image.jpg'):
    """
    Load an image, display it, and save this script with a random name.
    """
    # Try to load a sample image - if it doesn't exist, we'll create a blank image
    if os.path.exists(image_path):
        image = cv2.imread(image_path)
    else:
        print(f"Image {image_path} not found. Creating a sample image.")
        # Create a sample colored image
        image = np.zeros((400, 600, 3), dtype=np.uint8)
        # Draw some shapes to make it interesting
        cv2.rectangle(image, (100, 100), (300, 300), (0, 255, 0), -1)  # Green square
        cv2.circle(image, (400, 200), 80, (255, 0, 0), -1)  # Blue circle
        cv2.putText(image, 'Sample Image', (200, 350), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 0, 255), 2)  # Red text

    if image is None:
        print("Could not load image")
        return

    # Display the image
    cv2.imshow('Loaded Image', image)
    print("Press any key to close the image window and continue...")
    cv2.waitKey(0)
    cv2.destroyAllWindows()

    # Save this script with a random name
    script_content = '''import cv2
import numpy as np
import os
import random
import string

def generate_random_filename(extension='.py'):
    """Generate a random filename with the given extension."""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return random_name + extension

def load_display_save_image(image_path='sample_image.jpg'):
    """
    Load an image, display it, and save this script with a random name.
    """
    # Try to load a sample image - if it doesn't exist, we'll create a blank image
    if os.path.exists(image_path):
        image = cv2.imread(image_path)
    else:
        print(f"Image {image_path} not found. Creating a sample image.")
        # Create a sample colored image
        image = np.zeros((400, 600, 3), dtype=np.uint8)
        # Draw some shapes to make it interesting
        cv2.rectangle(image, (100, 100), (300, 300), (0, 255, 0), -1)  # Green square
        cv2.circle(image, (400, 200), 80, (255, 0, 0), -1)  # Blue circle
        cv2.putText(image, 'Sample Image', (200, 350), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 0, 255), 2)  # Red text

    if image is None:
        print("Could not load image")
        return

    # Display the image
    cv2.imshow('Loaded Image', image)
    print("Press any key to close the image window and continue...")
    cv2.waitKey(0)
    cv2.destroyAllWindows()

    # This function would normally save a copy of this script with a random name
    # but since we're running the script, we just show this message
    print("This script would save itself with a random name if it were a template.")

if __name__ == "__main__":
    load_display_save_image()
'''

    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Write the script content to the randomly named file
    with open(random_filename, 'w') as f:
        f.write(script_content)
    
    print(f"Saved this script as: {random_filename}")

if __name__ == "__main__":
    load_display_save_image()