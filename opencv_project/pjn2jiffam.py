import cv2
import sys
import os
import numpy as np

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
            print(f"Sample image created: {image_path}")
    
    # Load the image
    img = cv2.imread(image_path)
    
    if img is None:
        print(f"Error: Could not load image from {image_path}")
        return
    
    # Display information about the image
    print(f"Image loaded successfully with shape: {img.shape}")
    
    # Note: Display functionality is disabled in this environment-friendly version
    # In environments with a display, you could uncomment the following lines:
    # cv2.imshow('Image', img)
    # print("Press any key in the image window to continue...")
    # cv2.waitKey(0)
    # cv2.destroyAllWindows()
    print("Display functionality is disabled in this environment-friendly version.")
    
    # Save a copy of the image with a new name
    output_path = "output_" + image_path
    success = cv2.imwrite(output_path, img)
    if success:
        print(f"Image saved as {output_path}")
    else:
        print(f"Failed to save image as {output_path}")

if __name__ == "__main__":
    main()
