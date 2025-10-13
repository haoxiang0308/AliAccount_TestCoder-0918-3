import cv2
import numpy as np
import os

# Load an image from file
# For demonstration, we'll create a simple synthetic image if a file isn't found.
image_path = 'example_image.jpg'  # Replace with your image path
if os.path.exists(image_path):
    image = cv2.imread(image_path)
    if image is None:
        print(f"Could not load image from {image_path}. Creating a sample image instead.")
        image = np.zeros((300, 300, 3), dtype=np.uint8)
        cv2.rectangle(image, (50, 50), (250, 250), (0, 255, 0), -1)  # Green square
        cv2.circle(image, (150, 150), 50, (255, 0, 0), -1)          # Blue circle
else:
    print(f"Image file {image_path} not found. Creating a sample image instead.")
    image = np.zeros((300, 300, 3), dtype=np.uint8)
    cv2.rectangle(image, (50, 50), (250, 250), (0, 255, 0), -1)  # Green square
    cv2.circle(image, (150, 150), 50, (255, 0, 0), -1)          # Blue circle

# (Skipping display in headless environment)
print("Skipping image display in headless environment.")

# Save the image to a new file with a random name
import random
import string

def generate_random_filename(ext='.jpg'):
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}{ext}"

output_filename = generate_random_filename()
cv2.imwrite(output_filename, image)
print(f"Image saved as {output_filename}")
