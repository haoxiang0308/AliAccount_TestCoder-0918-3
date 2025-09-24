import cv2
import numpy as np
import os

# Load an image from the current directory. Replace 'image.jpg' with your image file.
# For demonstration, let's assume there's an image named 'lena.jpg' in the workspace.
image_path = 'test_image.jpg' # Use the generated test image

if os.path.exists(image_path):
    image = cv2.imread(image_path)

    if image is not None:
        # Save the loaded image with a random filename
        # Generate a random filename for the output image
        import random
        import string
        random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.jpg'
        cv2.imwrite(random_name, image)
        print(f"Image loaded from {image_path} and saved as {random_name}")
    else:
        print(f"Error: Could not load image from {image_path}. Check if it's a valid image file.")
else:
    print(f"Error: Image file {image_path} does not exist in the current directory.")
