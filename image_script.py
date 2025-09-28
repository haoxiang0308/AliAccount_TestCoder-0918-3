import cv2
import numpy as np
import os

# Load an image from the current directory. You might need to specify the full path.
image_path = 'input_image.jpg' # Change this to your image file name
image = cv2.imread(image_path)

if image is None:
    print(f"Error: Could not load image from {image_path}")
else:
    # Display the image in a window named 'Image'
    cv2.imshow('Image', image)
    print("Press any key on the image window to close it and continue...")
    cv2.waitKey(0) # Wait for a key press
    cv2.destroyAllWindows() # Close the window

    # Save the loaded image to a new file with a random name
    import random
    import string
    random_name = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    output_path = f"{random_name}.jpg"
    cv2.imwrite(output_path, image)
    print(f"Image saved as {output_path}")
