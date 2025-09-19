import cv2
import numpy as np
import uuid
import os

# Create a simple image (black background with a colored rectangle)
def create_sample_image():
    # Create a black image (300x300 pixels, 3 color channels)
    image = np.zeros((300, 300, 3), dtype=np.uint8)
    
    # Draw a blue rectangle
    cv2.rectangle(image, (50, 50), (250, 250), (255, 0, 0), -1)  # Filled blue rectangle
    
    # Draw a green circle
    cv2.circle(image, (150, 150), 50, (0, 255, 0), -1)  # Filled green circle
    
    # Add some text
    cv2.putText(image, 'OpenCV Demo', (70, 30), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 0, 255), 2)
    
    return image

# Create the sample image
img = create_sample_image()

# Generate a random filename
random_filename = f"image_{uuid.uuid4().hex}.jpg"

# Save the image
cv2.imwrite(random_filename, img)
print(f"Image saved as {random_filename}")

# Try to display the image (will only work if a display is available)
try:
    # Load the image
    loaded_img = cv2.imread(random_filename)
    
    # Display the image
    cv2.imshow('OpenCV Image Display', loaded_img)
    
    # Wait for a key press and then close the window
    print("Press any key in the image window to close it.")
    cv2.waitKey(0)
    cv2.destroyAllWindows()
except cv2.error as e:
    print("Display not available in this environment, skipping display step.")
    print(f"You can view the image file: {random_filename}")

# Verify the file was saved
if os.path.exists(random_filename):
    print(f"File {random_filename} successfully saved.")
else:
    print(f"Error: File {random_filename} was not saved.")