import random
import string
import os

# Generate a random filename
random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
script_name = f"/workspace/opencv_project/{random_name}.py"

# Create the OpenCV script content
script_content = '''import cv2
import sys
import os

def main():
    # Check if image file exists, if not create a sample image
    image_path = "sample_image.jpg"
    
    if not os.path.exists(image_path):
        # Create a sample image if it doesn't exist
        print("Creating a sample image...")
        img = cv2.imread("nonexistent.jpg")  # This will be None
        if img is None:
            # Create a blank white image
            img = np.ones((400, 600, 3), dtype=np.uint8) * 255
            # Add some text to make it interesting
            cv2.putText(img, 'OpenCV Sample Image', (50, 200), 
                       cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 0, 0), 2)
            cv2.imwrite(image_path, img)
    
    # Load the image
    img = cv2.imread(image_path)
    
    if img is None:
        print(f"Error: Could not load image from {image_path}")
        return
    
    # Display the image
    print(f"Displaying image with shape: {img.shape}")
    cv2.imshow('Image', img)
    
    # Wait for a key press and close the window
    print("Press any key in the image window to continue...")
    cv2.waitKey(0)
    cv2.destroyAllWindows()
    
    # Save a copy of the image with a new name
    output_path = "output_" + image_path
    cv2.imwrite(output_path, img)
    print(f"Image saved as {output_path}")

if __name__ == "__main__":
    # Import numpy here to avoid issues if it's not available
    try:
        import numpy as np
    except ImportError:
        print("Error: numpy is required but not installed.")
        sys.exit(1)
        
    main()
'''

# Write the script to the file
with open(script_name, "w") as f:
    f.write(script_content)

print(f"Created OpenCV script: {script_name}")