import cv2
import numpy as np

# Create a simple test image with a colored rectangle and text
img = np.zeros((400, 600, 3), dtype=np.uint8)
img[:] = [255, 255, 255]  # White background

# Draw a rectangle
cv2.rectangle(img, (50, 50), (250, 200), (0, 255, 0), -1)  # Green rectangle

# Draw a circle
cv2.circle(img, (400, 150), 75, (255, 0, 0), -1)  # Blue circle

# Add text
cv2.putText(img, 'Test Image', (200, 350), cv2.FONT_HERSHEY_SIMPLEX, 2, (0, 0, 0), 3)

# Save the test image
cv2.imwrite('test_image.jpg', img)
print("Test image created: test_image.jpg")