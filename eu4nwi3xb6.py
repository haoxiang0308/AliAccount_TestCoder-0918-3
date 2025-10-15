import cv2
import numpy as np
import random
import string
import os

def generate_random_filename(extension=".py"):
    """Generate a random filename with the specified extension."""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}{extension}"

def main():
    # Try to load a sample image (you can replace this with your own image path)
    # For demonstration, we'll create a simple image if no image exists
    sample_image_path = "sample_image.jpg"
    
    # Create a sample image if it doesn't exist
    if not os.path.exists(sample_image_path):
        # Create a simple colored image
        img = np.zeros((300, 300, 3), dtype=np.uint8)
        img[:] = [255, 100, 50]  # Blue, Green, Red
        # Add some text
        cv2.putText(img, 'Sample Image', (50, 150), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)
        cv2.imwrite(sample_image_path, img)
        print(f"Created sample image: {sample_image_path}")
    
    # Load the image
    image = cv2.imread(sample_image_path)
    
    if image is None:
        print(f"Error: Could not load image from {sample_image_path}")
        return
    
    print(f"Successfully loaded image with shape: {image.shape}")
    
    # Instead of displaying the image (which requires GUI), we'll just process it
    # For example, let's save a modified version
    modified_image = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    modified_image_path = "modified_sample_image.jpg"
    cv2.imwrite(modified_image_path, modified_image)
    print(f"Saved modified image: {modified_image_path}")
    
    # Generate a random filename for the script
    random_script_name = generate_random_filename(".py")
    
    # Read the current script content
    with open(__file__, 'r') as f:
        script_content = f.read()
    
    # Save the script to the new random filename
    with open(random_script_name, 'w') as f:
        f.write(script_content)
    
    print(f"Script saved with random name: {random_script_name}")

if __name__ == "__main__":
    main()