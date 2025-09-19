import cv2
import numpy as np

# Create a sample image (black background with colored shapes)
img = np.zeros((400, 600, 3), dtype=np.uint8)

# Draw a blue rectangle
cv2.rectangle(img, (50, 50), (200, 150), (255, 0, 0), -1)

# Draw a green circle
cv2.circle(img, (400, 100), 50, (0, 255, 0), -1)

# Draw a red line
cv2.line(img, (0, 300), (600, 300), (0, 0, 255), 5)

# Add some text
cv2.putText(img, 'OpenCV Demo', (150, 350), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)

# Save the image
filename = 'sample_image.jpg'
cv2.imwrite(filename, img)
print(f"Image saved as {filename}")