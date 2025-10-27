import cv2
import numpy as np
import os
import random
import string

def generate_random_filename(extension=".py"):
    """Generate a random filename with the specified extension."""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}{extension}"

def load_display_save_image(image_path):
    """
    Load an image, display it, and save this script with a random name.
    
    Args:
        image_path (str): Path to the input image
    """
    # Load the image
    img = cv2.imread(image_path)
    
    if img is None:
        print(f"Error: Could not load image from {image_path}")
        return
    
    print(f"Image loaded successfully with shape: {img.shape}")
    
    # Check if we're in a headless environment by checking environment variables
    import os
    if os.environ.get('DISPLAY') is None and os.environ.get('WAYLAND_DISPLAY') is None:
        print("Running in headless environment - skipping image display")
    else:
        # Try to create a window to see if GUI is available
        try:
            cv2.imshow('Loaded Image', img)
            print("Press any key to close the image window...")
            cv2.waitKey(0)  # Wait for a key press
            cv2.destroyAllWindows()  # Close the image window
        except:
            # If GUI is not available, just print a message
            print("Running in headless environment - skipping image display")
    
    # Create the OpenCV script content
    script_content = '''import cv2
import numpy as np
import os

def load_display_save_image(image_path):
    """
    Load an image, display it, and print completion message.
    
    Args:
        image_path (str): Path to the input image
    """
    # Load the image
    img = cv2.imread(image_path)
    
    if img is None:
        print(f"Error: Could not load image from {image_path}")
        return
    
    print(f"Image loaded successfully with shape: {img.shape}")
    
    # Check if we're in a headless environment by checking environment variables
    if os.environ.get('DISPLAY') is None and os.environ.get('WAYLAND_DISPLAY') is None:
        print("Running in headless environment - skipping image display")
    else:
        # Try to create a window to see if GUI is available
        try:
            cv2.imshow('Loaded Image', img)
            print("Press any key to close the image window...")
            cv2.waitKey(0)  # Wait for a key press
            cv2.destroyAllWindows()  # Close the image window
        except:
            # If GUI is not available, just print a message
            print("Running in headless environment - skipping image display")
    
    print("Image processing completed!")

if __name__ == "__main__":
    # Example usage - replace with your image path
    image_path = "example.jpg"  # Change this to your image path
    load_display_save_image(image_path)
'''
    
    # Generate a random filename and save the script
    random_filename = generate_random_filename()
    with open(random_filename, 'w') as f:
        f.write(script_content)
    
    print(f"Script saved as: {random_filename}")

if __name__ == "__main__":
    # Example usage - using a placeholder image
    # In a real scenario, you would provide an actual image path
    image_path = "example.jpg"  # This is just a placeholder
    
    # Check if the example image exists, if not, create a simple one
    if not os.path.exists(image_path):
        # Create a simple test image
        test_img = np.zeros((300, 300, 3), dtype=np.uint8)
        test_img[:] = [255, 100, 0]  # Blue background
        cv2.rectangle(test_img, (50, 50), (250, 250), (0, 255, 0), -1)  # Green square
        cv2.putText(test_img, 'TEST', (100, 150), cv2.FONT_HERSHEY_SIMPLEX, 2, (0, 0, 0), 3)
        cv2.imwrite("example.jpg", test_img)
        print("Created example.jpg for testing")
        image_path = "example.jpg"
    
    load_display_save_image(image_path)