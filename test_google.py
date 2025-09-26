from selenium import webdriver
from selenium.webdriver.common.by import By
import time
import random
import string

# Generate a random filename
random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'

# Initialize the driver
driver = webdriver.Chrome()  # Make sure you have chromedriver installed and in PATH

try:
    # Open Google
    driver.get("https://www.google.com")

    # Wait a bit to see the page
    time.sleep(2)

    # Get the page title as an example of interacting with the page
    title = driver.title
    print(f"Page title is: {title}")

    # Save a simple script that opens Google to the random file
    script_content = '''from selenium import webdriver
driver = webdriver.Chrome()
driver.get("https://www.google.com")
input("Press Enter to close the browser...")
driver.quit()
'''
    with open(random_filename, 'w') as f:
        f.write(script_content)

    print(f"Selenium script saved to {random_filename}")

finally:
    # Close the browser
    driver.quit()
