import cv2
import numpy as np
import os
import random
import string

# Load an image from the current directory
image_path = 'sample_image.jpg'  # Replace with your image path
image = cv2.imread(image_path)

if image is None:
    print(f"Error: Could not load image from {image_path}")
else:
    print("Image loaded successfully.")

    # Generate a random filename for the output Python script
    random_name = 'random_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.py'
    
    # Define the content for the new script, excluding the display part
    script_content = '''import cv2
import numpy as np
import os

# Load an image from the current directory
image_path = 'sample_image.jpg'  # Replace with your image path
image = cv2.imread(image_path)

if image is None:
    print(f"Error: Could not load image from {image_path}")
else:
    print("Image loaded successfully.")

    # Generate a random filename for the output Python script
    import random
    import string
    random_name = 'random_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.py'
    
    # Print the name of the random file that would be created
    print(f"This script would normally save itself as: {random_name}")
    # The actual saving part is omitted here to prevent an infinite loop.
'''

    print(f"Saving script to: {random_name}")
    with open(random_name, 'w') as f:
        f.write(script_content)
    print(f"File {random_name} has been created successfully.")
