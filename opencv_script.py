import cv2
import numpy as np
import os

# Load an image from the system (replace 'path_to_image' with an actual image path if needed)
# For demonstration, we'll create a simple synthetic image
image = np.zeros((300, 300, 3), dtype=np.uint8)
image[:] = [255, 105, 180]  # Pink background
cv2.rectangle(image, (100, 100), (200, 200), (0, 255, 0), -1)  # Green square

# (Display functionality removed for headless environment)
# The image is created and saved directly.

# Save the image to a file with a random name
random_filename = f"output_image_{np.random.randint(10000, 99999)}.png"
cv2.imwrite(random_filename, image)
print(f"Image saved as {random_filename}")
