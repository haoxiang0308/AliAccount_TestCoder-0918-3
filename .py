import cv2
import uuid
import time
import os

# Load the image
image = cv2.imread('sample.jpg')

# Check if image was loaded successfully
if image is None:
    print("Error: Could not load image. Please check the file path.")
else:
    print("Image loaded successfully.")
    
    # Generate a random filename
    random_filename = str(uuid.uuid4()) + ".jpg"
    
    # Save the image with the random filename
    success = cv2.imwrite(random_filename, image)
    
    if success:
        print(f"Image saved as: {random_filename}")
    else:
        print("Error: Could not save image.")
        
    # Also save with a fixed name for verification
    cv2.imwrite("output_image.jpg", image)
    print("Image also saved as: output_image.jpg")