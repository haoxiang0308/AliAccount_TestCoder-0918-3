import cv2
import numpy as np
import random
import string
import os
import sys

def create_sample_image():
    """Create a sample image with some shapes and colors"""
    # Create a black image
    img = np.zeros((400, 600, 3), dtype=np.uint8)
    
    # Draw a blue rectangle
    cv2.rectangle(img, (50, 50), (200, 150), (255, 0, 0), -1)
    
    # Draw a green circle
    cv2.circle(img, (400, 100), 50, (0, 255, 0), -1)
    
    # Draw a red line
    cv2.line(img, (0, 300), (600, 300), (0, 0, 255), 5)
    
    # Add some text
    cv2.putText(img, 'OpenCV Demo', (200, 350), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)
    
    return img

def generate_random_filename(extension='.jpg'):
    """Generate a random filename with the given extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}{extension}"

def main():
    # Create a sample image
    print("Creating a sample image...")
    image = create_sample_image()
    
    # Check if we're in a headless environment
    display_available = 'DISPLAY' in os.environ
    
    # Try to display the image only if display is available
    if display_available:
        print("Display environment detected. Attempting to display the image...")
        cv2.imshow('Sample Image', image)
        print("Press any key in the image window to continue...")
        cv2.waitKey(0)  # Wait for a key press
        cv2.destroyAllWindows()
        display_success = True
    else:
        print("No display environment detected (headless environment). Skipping image display...")
        display_success = False
    
    # Generate a random filename
    filename = generate_random_filename()
    
    # Save the image
    success = cv2.imwrite(filename, image)
    
    if success:
        print(f"Image saved successfully as {filename}")
        print(f"File size: {os.path.getsize(filename)} bytes")
    else:
        print("Error saving the image")
    
    # Show the saved file in current directory
    print("\nFiles in current directory:")
    for file in os.listdir('.'):
        if file.endswith(('.jpg', '.png', '.jpeg')):
            print(f"- {file}")
    
    if display_available:
        print("\nImage was displayed successfully.")
    else:
        print("\nImage was not displayed (headless environment).")

if __name__ == "__main__":
    main()