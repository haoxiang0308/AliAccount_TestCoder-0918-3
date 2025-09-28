import cv2
import numpy as np
import os

# Load an image from the workspace. Using a placeholder name for now.
# In a real scenario, you would specify the path to your image.
image_path = 'first.txt'  # Placeholder, this is not an image file

# Let's create a dummy image instead since no image file is guaranteed to exist.
# Create a white image
img = 255 * np.ones((300, 300, 3), dtype=np.uint8)



# Save the dummy image to a file first
temp_image_path = 'temp_image.jpg'
cv2.imwrite(temp_image_path, img)

# Now load the saved image
loaded_img = cv2.imread(temp_image_path)

# Save the loaded image with a random filename
random_filename = np.random.bytes(8).hex() + '.jpg'
cv2.imwrite(random_filename, loaded_img)

print(f"Original image displayed and saved with random filename: {random_filename}")

# Clean up the temporary image file
os.remove(temp_image_path)