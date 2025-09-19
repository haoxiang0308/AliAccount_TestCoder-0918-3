import cv2
import numpy as np
import random
import string

def generate_random_filename():
    """Generate a random filename with .png extension"""
    random_name = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    return f"{random_name}.png"

def create_sample_image():
    """Create a sample image with OpenCV"""
    # Create a black image
    img = np.zeros((300, 300, 3), dtype=np.uint8)
    
    # Draw a blue rectangle
    cv2.rectangle(img, (50, 50), (250, 150), (255, 0, 0), -1)
    
    # Draw a green circle
    cv2.circle(img, (150, 200), 50, (0, 255, 0), -1)
    
    # Draw red text
    cv2.putText(img, 'OpenCV Demo', (60, 270), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 0, 255), 2)
    
    return img

def main():
    # Create a sample image
    image = create_sample_image()
    
    # Save the image
    save_filename = generate_random_filename()
    cv2.imwrite(save_filename, image)
    print(f"Image saved as {save_filename}")

if __name__ == "__main__":
    main()