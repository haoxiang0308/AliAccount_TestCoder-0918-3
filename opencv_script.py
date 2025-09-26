import cv2
import numpy as np
import os

# An image would normally be loaded here using cv2.imread('path/to/your/image.jpg')
# For this example, we'll just print a message indicating the script's purpose.
print("This script would load and display an image using OpenCV if a GUI environment were available.")

# Save the script itself to a randomly named .py file
import random
import string

# Generate a random filename
random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'

# Read the content of the current script
with open(__file__, 'r') as f:
    script_content = f.read()

# Write the content to the new random filename
with open(random_filename, 'w') as f:
    f.write(script_content)

print(f"Script saved to {random_filename}")