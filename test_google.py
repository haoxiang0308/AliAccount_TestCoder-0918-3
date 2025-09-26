from selenium import webdriver
from selenium.webdriver.common.by import By
import time
import random
import string

# Generate a random filename
random_filename = ''.join(random.choices(string.ascii_letters + string.digits, k=10)) + '.py'

# Create the Selenium script content
script_content = '''from selenium import webdriver
from selenium.webdriver.common.by import By
import time

driver = webdriver.Chrome()  # Make sure you have chromedriver installed and in PATH
try:
    driver.get("https://www.google.com")
    time.sleep(2)  # Let the page load
    print("Page title is:", driver.title)
finally:
    driver.quit()
'''

# Save the script content to the randomly named file
with open(random_filename, 'w') as f:
    f.write(script_content)

print(f"Selenium test script saved to {random_filename}")
