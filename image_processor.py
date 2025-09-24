import cv2
import numpy as np
import os

def load_and_display_image(image_path):
    """
    Loads an image from the given path, displays it, and saves a copy.
    """
    # Load the image
    img = cv2.imread(image_path)

    # Check if image is loaded successfully
    if img is None:
        print(f"Error: Could not load image from {image_path}")
        return

    # Display the image in a window named 'Image'
    cv2.imshow('Image', img)

    # Wait for a key press and then close the window
    print("Press any key on the image window to continue...")
    cv2.waitKey(0)
    cv2.destroyAllWindows()

    # Generate a random filename for the saved image
    base_name, ext = os.path.splitext(image_path)
    random_name = f"random_image_copy_{np.random.randint(1000, 9999)}.png"
    
    # Save the image with the random name
    success = cv2.imwrite(random_name, img)
    if success:
        print(f"Image saved as {random_name}")
    else:
        print("Failed to save the image.")

if __name__ == "__main__":
    # Example usage: Load and display an image
    # Note: Replace 'path/to/your/image.jpg' with an actual image path in your environment
    image_path = 'path/to/your/image.jpg' 
    load_and_display_image(image_path)
