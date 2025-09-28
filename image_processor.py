import cv2
import numpy as np
import os
import uuid

# Load an image from file
# Replace 'path_to_your_image.jpg' with the actual path to your image
image_path = '/workspace/lena.png'  # Using a common test image if available, or specify your path
image = cv2.imread(image_path)

if image is None:
    print(f"Error: Could not load image from {image_path}")
    # Create a dummy image if the file is not found
    image = np.zeros((300, 300, 3), dtype=np.uint8)
    cv2.rectangle(image, (50, 50), (250, 250), (0, 255, 0), -1)  # Draw a green square
    print("Created a dummy image instead.")

# Print a message instead of displaying the image in a window
print("Image loaded successfully. (Display skipped in this environment.)")

# Generate a random filename
random_filename = f"image_script_{uuid.uuid4().hex[:8]}.py"

# This script saves itself to a new file with the random name
with open(random_filename, 'w') as f:
    f.write('# Saved copy of the image processing script\\n')
    f.write('# Original logic: Load, display, and save mechanism\\n\\n')
    f.write('# Note: The image path might need to be updated in the saved copy\\n')
    f.write('import cv2\\n')
    f.write('import numpy as np\\n')
    f.write('import uuid\\n\\n')
    f.write('image = cv2.imread(image_path)\\n')
    f.write('if image is not None:\\n')
    f.write('    cv2.imshow(\"Loaded Image\", image)\\n')
    f.write('    cv2.waitKey(0)\\n')
    f.write('    cv2.destroyAllWindows()\\n')
    f.write('else:\\n')
    f.write('    print(\"Image could not be loaded even in saved script\")\\n')

print(f"Script saved to {random_filename}")
