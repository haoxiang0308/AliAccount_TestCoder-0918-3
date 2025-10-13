import random
import string
from selenium import webdriver
from selenium.webdriver.common.by import By
import time

def generate_random_filename(length=10):
    """Generates a random filename with a .py extension."""
    letters = string.ascii_lowercase
    random_string = ''.join(random.choice(letters) for i in range(length))
    return f"{random_string}.py"

# Initialize the web driver
driver = webdriver.Chrome() # Make sure you have chromedriver installed and in PATH

try:
    # Open Google
    driver.get("https://www.google.com")
    
    # Wait a bit to see the page load
    time.sleep(2)
    
    # Generate a random filename
    filename = generate_random_filename()
    
    # Save a simple confirmation message to the random file
    with open(filename, 'w') as f:
        f.write('# This file was generated after opening Google with Selenium\n')
        f.write('print("Test completed successfully on Google homepage")\n')
    
    print(f"Test completed. Confirmation saved to {filename}")

finally:
    # Close the browser
    driver.quit()
