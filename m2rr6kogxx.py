import cv2
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
