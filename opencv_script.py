import cv2
import numpy as np
import uuid

# Create a sample image (black image with a white rectangle)
def create_sample_image():
    # Create a black image
    img = np.zeros((400, 400, 3), dtype=np.uint8)
    
    # Draw a white rectangle
    cv2.rectangle(img, (100, 100), (300, 300), (255, 255, 255), -1)
    
    # Draw some text
    cv2.putText(img, 'OpenCV Demo', (110, 200), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 0, 255), 2)
    
    return img

# Generate a random filename
random_filename = f"image_{uuid.uuid4().hex}.jpg"

# Create and save a sample image first
sample_img = create_sample_image()
cv2.imwrite("sample_image.jpg", sample_img)
print(f"Created sample image: sample_image.jpg")

# Load the image
img = cv2.imread("sample_image.jpg")

# Check if image is loaded successfully
if img is None:
    print("Error: Could not load image.")
else:
    # Save the image with a random name (skip display in headless environments)
    cv2.imwrite(random_filename, img)
    print(f"Saved image as: {random_filename}")
    
    # Clean up the sample image
    import os
    os.remove("sample_image.jpg")
    print("Cleaned up temporary files.")