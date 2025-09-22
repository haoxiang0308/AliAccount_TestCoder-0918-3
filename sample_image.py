import numpy as np

# Create a simple sample image (black image with a white rectangle)
image = np.zeros((300, 300, 3), dtype=np.uint8)
image[100:200, 100:200] = [255, 255, 255]  # White square

# Save the image
import cv2
cv2.imwrite('sample.jpg', image)
print("Sample image created successfully!")