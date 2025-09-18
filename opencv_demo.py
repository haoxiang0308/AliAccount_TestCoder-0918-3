import cv2
import numpy as np
import random
import string
import os

# Create a sample image (black background with colored shapes)
height, width = 400, 600
image = np.zeros((height, width, 3), dtype=np.uint8)

# Draw a blue rectangle
cv2.rectangle(image, (50, 50), (200, 150), (255, 0, 0), -1)

# Draw a green circle
cv2.circle(image, (400, 100), 50, (0, 255, 0), -1)

# Draw a red ellipse
cv2.ellipse(image, (300, 300), (100, 50), 45, 0, 360, (0, 0, 255), -1)

# Add some text
cv2.putText(image, 'OpenCV Demo', (100, 350), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)

# Generate a random filename
random_suffix = ''.join(random.choices(string.ascii_letters + string.digits, k=8))
filename = f"image_{random_suffix}.jpg"

# Save the image
cv2.imwrite(filename, image)
print(f"Image saved as {filename}")

# Also save to the images directory
images_dir = "images"
if not os.path.exists(images_dir):
    os.makedirs(images_dir)

image_path = os.path.join(images_dir, filename)
cv2.imwrite(image_path, image)
print(f"Image also saved to {image_path}")