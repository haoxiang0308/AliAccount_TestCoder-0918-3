import cv2
import numpy as np
import os

# Load an image from the current directory
image_path = 'sample_image.jpg'  # Replace with your image path
image = cv2.imread(image_path)

if image is None:
    print(f"Error: Could not load image from {image_path}")
else:
    # Display the image in a window
    cv2.imshow('Loaded Image', image)
    print("Press any key on the image window to close it...")
    cv2.waitKey(0)  # Wait for a key press
    cv2.destroyAllWindows()  # Close the window

    # Generate a random filename for the output Python script
    import random
    import string
    random_name = 'random_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.py'
    
    # Save this script itself to the randomly named file
    script_content = '''import cv2
import numpy as np
import os

# Load an image from the current directory
image_path = 'sample_image.jpg'  # Replace with your image path
image = cv2.imread(image_path)

if image is None:
    print(f"Error: Could not load image from {image_path}")
else:
    # Display the image in a window
    cv2.imshow('Loaded Image', image)
    print("Press any key on the image window to close it...")
    cv2.waitKey(0)  # Wait for a key press
    cv2.destroyAllWindows()  # Close the window

    # Generate a random filename for the output Python script
    import random
    import string
    random_name = 'random_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.py'
    
    # Print the name of the random file that would be created
    print(f"This script would normally save itself as: {random_name}")
    # open(random_name, 'w').write(\"\"\" + script_content + \"\"\")
'''
    print(f"Saving script to: {random_name}")
    with open(random_name, 'w') as f:
        f.write(script_content)
