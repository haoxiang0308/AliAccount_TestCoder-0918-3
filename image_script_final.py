import cv2
import numpy as np
import os

# Load an image from file
image_path = '/workspace/test_image.jpg'
image = cv2.imread(image_path)

# Check if image is loaded successfully
if image is None:
    print(f"Error: Could not load image from {image_path}")
else:
    # Display the image in a window
    cv2.imshow('Loaded Image', image)

    # Wait for a key press and close the window
    print("Press any key on the image window to close it and save the script.")
    cv2.waitKey(0)
    cv2.destroyAllWindows()

    # Save this script with a random name
    # Generate a random filename for the Python script
    import random
    import string
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.py'

    # Get the current script's source code (this file)
    current_script_content = '''import cv2
import numpy as np
import os

# Load an image from file
image_path = '/workspace/test_image.jpg'
image = cv2.imread(image_path)

# Check if image is loaded successfully
if image is None:
    print(f"Error: Could not load image from {image_path}")
else:
    # Display the image in a window
    cv2.imshow('Loaded Image', image)

    # Wait for a key press and close the window
    print("Press any key on the image window to close it and save the script.")
    cv2.waitKey(0)
    cv2.destroyAllWindows()

    # Save this script with a random name
    # Generate a random filename for the Python script
    import random
    import string
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.py'

    # Get the current script's source code (this file)
    current_script_content = {!r}

    # Write the current script's content to the new file
    with open(random_name, 'w') as f:
        f.write(current_script_content)

    print(f"Script saved as: {random_name}")
'''.format(__file__)

    # Write the current script's content to the new file
    with open(random_name, 'w') as f:
        f.write(current_script_content)

    print(f"Script saved as: {random_name}")
