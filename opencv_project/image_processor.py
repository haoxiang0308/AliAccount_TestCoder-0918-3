import cv2
import uuid
import os

# Load an image from file
image = cv2.imread('test_image.jpg')

# Check if image was loaded successfully
if image is None:
    print("Error: Could not load image. Please check the file path.")
else:
    # Generate a random filename
    random_filename = str(uuid.uuid4()) + '.jpg'
    
    # Save the image with the random filename
    success = cv2.imwrite(random_filename, image)
    
    if success:
        print(f"Image saved as {random_filename}")
    else:
        print("Error: Could not save image.")
        
    # Note: Display functionality removed for headless environments
    print("Image processing completed in headless mode.")