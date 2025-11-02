import cv2
import numpy as np

# Create a sample image with OpenCV
# Create a 300x300 RGB image with a gradient
height, width = 300, 300
image = np.zeros((height, width, 3), dtype=np.uint8)

# Create a simple gradient pattern
for i in range(height):
    for j in range(width):
        image[i, j] = [(i * 255) // height, (j * 255) // width, 128]

# Save the sample image
cv2.imwrite('sample_image.jpg', image)
print("Sample image created: sample_image.jpg")