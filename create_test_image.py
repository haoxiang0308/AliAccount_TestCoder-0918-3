from PIL import Image, ImageDraw, ImageFont
import numpy as np

# Create a test image
width, height = 300, 200
image = Image.new('RGB', (width, height), color=(76, 175, 80))  # Green background
draw = ImageDraw.Draw(image)

# Add text
draw.text((width//2, height//2), "Test Image", fill=(255, 255, 255), anchor="mm")

# Save the image
image.save('/workspace/test_image.jpg')
print("Test image created successfully!")