import cv2
import numpy as np
import os

# Load an image from file
# Replace 'path_to_your_image.jpg' with the actual path to your image file
image_path = 'path_to_your_image.jpg'
image = cv2.imread(image_path)

# Check if image is loaded successfully
if image is None:
    print(f"Error: Could not load image from {image_path}")
else:
    # Display the image in a window named 'Image'
    cv2.imshow('Image', image)

    # Wait for a key press and close the window
    print("Press any key on the image window to close it and save the script.")
    cv2.waitKey(0)
    cv2.destroyAllWindows()

    # --- Saving the script with a random name ---
    # This part is just for demonstration as the script name is already fixed.
    # In a real scenario, you would generate this script dynamically.
    # For this example, we'll just print the current script's name.
    current_script_name = __file__
    print(f"The script is saved as: {current_script_name}")
