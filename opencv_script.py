import cv2
import numpy as np
import os

# Load an image from file.
# For demonstration, we'll create a simple synthetic image if a file isn't found.
image_path = 'sample_image.jpg' # You can replace this with the path to your image file
if os.path.exists(image_path):
    image = cv2.imread(image_path)
    if image is None:
        print(f"Could not load image from {image_path}. Creating a sample image instead.")
        image = np.zeros((300, 300, 3), dtype=np.uint8)
        cv2.rectangle(image, (50, 50), (250, 250), (0, 255, 0), -1) # Green square
        cv2.circle(image, (150, 150), 50, (255, 0, 0), -1) # Blue circle
else:
    print(f"Image file {image_path} not found. Creating a sample image instead.")
    image = np.zeros((300, 300, 3), dtype=np.uint8)
    cv2.rectangle(image, (50, 50), (250, 250), (0, 255, 0), -1) # Green square
    cv2.circle(image, (150, 150), 50, (255, 0, 0), -1) # Blue circle

# Note: Displaying the image requires a GUI environment which may not be available.
# The script will proceed to save the image without displaying it.
print("Image loaded/created successfully. Proceeding to save...")

# Save the (potentially modified) image to a new file with a random name.
import random
import string
random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.jpg'
cv2.imwrite(random_filename, image)
print(f"Image saved as {random_filename}")
