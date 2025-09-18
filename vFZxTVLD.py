import cv2
import numpy as np

# Create a sample image (black image with a white rectangle)
img = np.zeros((300, 300, 3), dtype=np.uint8)
cv2.rectangle(img, (50, 50), (250, 250), (255, 255, 255), -1)

# Save the image
cv2.imwrite('output_image.jpg', img)
print("Image saved as output_image.jpg")