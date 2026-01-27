import cv2
import random
import string

def load_and_display_image(image_path, save_filename):
    """
    Load an image, display it, and save it with a new name.
    
    Args:
        image_path: Path to the input image file
        save_filename: Name to save the output image as
    """
    # Read the image from file
    img = cv2.imread(image_path)
    
    if img is None:
        print(f"Error: Could not load image from {image_path}")
        return
    
    # Display the image in a window
    cv2.imshow('Loaded Image', img)
    
    # Wait for a key press and close the window
    cv2.waitKey(0)
    cv2.destroyAllWindows()
    
    # Save the image with the new filename
    success = cv2.imwrite(save_filename, img)
    
    if success:
        print(f"Image successfully saved as {save_filename}")
    else:
        print(f"Error: Failed to save image as {save_filename}")

def generate_random_filename(extension='.jpg'):
    """Generate a random filename."""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"image_{random_string}{extension}"

if __name__ == "__main__":
    # Replace this with your actual image path
    input_image_path = "input.jpg"
    
    # Generate a random output filename
    output_filename = generate_random_filename()
    
    # Load, display, and save the image
    load_and_display_image(input_image_path, output_filename)
