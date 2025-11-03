import cv2
import numpy as np
import random
import string

def load_display_save_image():
    # Create a simple image
    img = np.zeros((300, 300, 3), dtype=np.uint8)
    img[:, :] = [0, 255, 0]  # Green color
    
    print("Image created in memory...")
    
    # Generate random filename
    random_name = ''.join(random.choices(string.ascii_letters + string.digits, k=12))
    filename = f"{{random_name}}.jpg"
    
    # Save the image
    cv2.imwrite(filename, img)
    print(f"Image saved as: {{filename}}")

if __name__ == "__main__":
    load_display_save_image()
