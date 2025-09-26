import cv2
import numpy as np
import os

# Load an image from file
# Using a placeholder path; in practice, you'd specify an existing image path.
image_path = 'placeholder_image.jpg' # This should be replaced with an actual image file path.
image = cv2.imread(image_path)

if image is None:
    print(f"Error: Could not load image from {image_path}. Using a blank image instead.")
    # Create a blank black image if loading fails
    image = np.zeros((512, 512, 3), dtype=np.uint8)

# Display the image in a window
cv2.imshow('Loaded Image', image)
cv2.waitKey(0)  # Wait for a key press
cv2.destroyAllWindows()  # Close the window

# Save the script with a random name
script_content = '''import cv2
import numpy as np

# Load an image from file
image_path = 'placeholder_image.jpg'
image = cv2.imread(image_path)

if image is None:
    print(f"Error: Could not load image from {image_path}. Using a blank image instead.")
    image = np.zeros((512, 512, 3), dtype=np.uint8)

# Display the image in a window
cv2.imshow('Loaded Image', image)
cv2.waitKey(0)  # Wait for a key press
cv2.destroyAllWindows()  # Close the window

# Optional: Save the processed image (or the original if loaded successfully)
# cv2.imwrite('processed_output.jpg', image)
'''

# Generate a random filename for the Python script
random_filename = f"opencv_script_{os.urandom(8).hex()}.py"

# Write the script content to the new file
with open(random_filename, 'w') as f:
    f.write(script_content)

print(f"Script saved as {random_filename}")
