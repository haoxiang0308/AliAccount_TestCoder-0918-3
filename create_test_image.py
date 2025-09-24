import cv2
import numpy as np

# Create a simple test image (a white square with a black circle)
image = np.ones((300, 300, 3), dtype=np.uint8) * 255  # White background
cv2.circle(image, (150, 150), 100, (0, 0, 0), -1)     # Black circle in the center

# Save the generated image as 'test_image.jpg'
cv2.imwrite('test_image.jpg', image)
print("Test image 'test_image.jpg' created successfully.")