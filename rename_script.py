import uuid
import os

# Generate a random UUID for the filename
random_filename = f"/workspace/{str(uuid.uuid4())}.py"

# The content for the new file
selenium_test_content = '''from selenium import webdriver
from selenium.webdriver.common.by import By
import time

# Initialize the Chrome WebDriver
driver = webdriver.Chrome()

try:
    # Open Google
    driver.get("https://www.google.com")

    # Add a small delay to see the page load (optional)
    time.sleep(2)

    print("Successfully opened Google.")

    # You can add more interactions here if needed

finally:
    # Close the browser window
    driver.quit()
'''

# Write the content to the randomly named file
with open(random_filename, 'w') as f:
    f.write(selenium_test_content)

print(f"Selenium test script created: {random_filename}")
