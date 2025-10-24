import cv2
import numpy as np

# Create a simple test image (a colored rectangle with some text)
image = np.zeros((300, 300, 3), dtype=np.uint8)
image[:] = [255, 100, 50]  # Blue, Green, Red - orange color

# Add some shapes to make it more interesting
cv2.rectangle(image, (50, 50), (250, 250), (0, 255, 0), 2)
cv2.putText(image, 'TEST IMAGE', (70, 150), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)

# Save the image
cv2.imwrite('test_image.jpg', image)
print("Test image created successfully!")