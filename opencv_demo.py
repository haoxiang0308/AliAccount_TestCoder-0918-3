import cv2
import numpy as np
import uuid
import os

# Create a simple image (black background with a colored rectangle)
def create_sample_image():
    # Create a black image
    img = np.zeros((300, 300, 3), dtype=np.uint8)
    
    # Draw a blue rectangle
    cv2.rectangle(img, (50, 50), (250, 250), (255, 0, 0), -1)
    
    # Draw a green circle
    cv2.circle(img, (150, 150), 50, (0, 255, 0), -1)
    
    # Draw red text
    cv2.putText(img, 'OpenCV Demo', (60, 160), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 0, 255), 2)
    
    return img

# Create and save a sample image
sample_img = create_sample_image()
source_filename = "sample_image.png"
cv2.imwrite(source_filename, sample_img)
print(f"Created sample image: {source_filename}")

# Load an image from file
img = cv2.imread(source_filename)

# Check if image was loaded successfully
if img is None:
    print(f"Error: Could not load image from {source_filename}")
    exit()

# Display image information
print(f"Image shape: {img.shape}")
print(f"Image dtype: {img.dtype}")

# Save the image with a random name
random_filename = f"opencv_output_{uuid.uuid4().hex}.png"
cv2.imwrite(random_filename, img)
print(f"Saved image to: {random_filename}")

# Verify the saved image
saved_img = cv2.imread(random_filename)
if saved_img is not None:
    print(f"Verified saved image: {random_filename}")
    print(f"Saved image shape: {saved_img.shape}")
else:
    print(f"Error: Could not verify saved image {random_filename}")