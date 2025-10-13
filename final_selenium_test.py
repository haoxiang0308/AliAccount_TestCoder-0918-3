from selenium import webdriver
from selenium.webdriver.chrome.service import Service
import random
import string

def generate_random_filename(length=10):
    """Generates a random filename with a .py extension."""
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(length)) + '.py'

# Generate a random filename first
random_filename = generate_random_filename()

# Write the basic selenium test content to the file
with open(random_filename, 'w') as f:
    f.write('from selenium import webdriver\n\n')
    f.write('driver = webdriver.Chrome()\n')
    f.write('driver.get("https://www.google.com")\n')
    f.write('print(f"Opened Google in {__file__}")\n')
    f.write('# driver.quit() # Remember to quit the driver when done\n')

print(f"Selenium test script content written to {random_filename}")

# Now try to run the selenium test, which might fail due to missing driver
try:
    driver = webdriver.Chrome()
    driver.get('https://www.google.com')
    print("Successfully opened Google!")
    driver.quit()
except Exception as e:
    print(f"Selenium test failed due to: {e}")
    print("This is expected if ChromeDriver is not configured.")
