import cv2
import numpy as np
import os

# Load an image from the current directory
image_path = 'sample_image.jpg'  # Replace with your image path
image = cv2.imread(image_path)

if image is None:
    print(f"Error: Could not load image from {image_path}")
else:
    print("Image loaded successfully.")

    # Generate a random filename for the output Python script
    import random
    import string
    random_name = 'random_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.py'
    
    # Print the name of the random file that would be created
    print(f"This script would normally save itself as: {random_name}")
    # The actual saving part is omitted here to prevent an infinite loop.
