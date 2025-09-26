import cv2
import numpy as np
import os

# Load an image from the web or a local file
# For this example, we'll create a simple synthetic image
image = np.zeros((300, 300, 3), dtype=np.uint8)
image[:] = [255, 0, 0]  # Blue background

# Draw a circle
cv2.circle(image, (150, 150), 50, (0, 255, 0), -1)  # Green circle

# Display the image
cv2.imshow('Generated Image', image)
cv2.waitKey(0)  # Wait for a key press
cv2.destroyAllWindows()  # Close the window

# Save the image as a .jpg file
cv2.imwrite('/workspace/generated_image.jpg', image)

print("Image processed, displayed, and saved as 'generated_image.jpg'.")