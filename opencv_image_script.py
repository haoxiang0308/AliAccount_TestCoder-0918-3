import cv2
import numpy as np
import random
import string

def load_and_display_image(image_path):
    """Load an image using OpenCV (without GUI display in headless environment)"""
    # Load the image
    image = cv2.imread(image_path)
    
    if image is None:
        print(f"Error: Could not load image from {image_path}")
        return None
    
    # Print information about the loaded image instead of displaying it
    height, width, channels = image.shape
    print(f"Image loaded successfully: {width}x{height} pixels, {channels} channels")
    
    return image

def save_image_to_random_py_file(image, original_path):
    """Save the image processing script to a randomly named .py file"""
    # Generate a random filename with .py extension
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    random_filename = f"{random_name}.py"
    
    # Create the content for the new Python file
    script_content = f'''# Randomly generated script that processes image: {original_path}
import cv2
import numpy as np

# Load the image
image = cv2.imread('{original_path}')
if image is not None:
    # Display the image
    cv2.imshow('Image from {random_filename}', image)
    print("Press any key on the image window to continue...")
    cv2.waitKey(0)
    cv2.destroyAllWindows()
    
    # You can perform additional image processing here
    print("Image processed successfully!")
else:
    print("Could not load image")
'''
    
    # Write the content to the randomly named file
    with open(random_filename, 'w') as f:
        f.write(script_content)
    
    print(f"Script saved to randomly named file: {random_filename}")
    return random_filename

def main():
    # Path to the sample image we created
    image_path = 'sample_image.jpg'
    
    # Load and display the image
    image = load_and_display_image(image_path)
    
    if image is not None:
        print(f"Image loaded successfully from {image_path}")
        
        # Save the script to a randomly named .py file
        random_file = save_image_to_random_py_file(image, image_path)
        
        print(f"All operations completed. Random script file created: {random_file}")

if __name__ == "__main__":
    main()