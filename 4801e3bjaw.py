# Randomly generated script that processes image: sample_image.jpg
import cv2
import numpy as np

# Load the image
image = cv2.imread('sample_image.jpg')
if image is not None:
    # Display the image
    cv2.imshow('Image from 4801e3bjaw.py', image)
    print("Press any key on the image window to continue...")
    cv2.waitKey(0)
    cv2.destroyAllWindows()
    
    # You can perform additional image processing here
    print("Image processed successfully!")
else:
    print("Could not load image")
