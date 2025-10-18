import cv2
import numpy as np
import random
import string

# Create a sample image for demonstration
sample_image = np.zeros((300, 300, 3), dtype=np.uint8)
sample_image[:] = [255, 100, 50]  # Blue background

# Add some shapes to make it more interesting
cv2.rectangle(sample_image, (50, 50), (250, 100), (0, 255, 0), -1)  # Green rectangle
cv2.circle(sample_image, (150, 200), 50, (0, 0, 255), -1)  # Red circle

# Save the sample image
cv2.imwrite('sample.jpg', sample_image)
print("Sample image created: sample.jpg")