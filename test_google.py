from selenium import webdriver
from selenium.webdriver.common.by import By
import time
import random
import string

# Generate a random filename
random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'

# Open the web driver (using Chrome in this example)
driver = webdriver.Chrome()

try:
    # Navigate to Google
    driver.get("https://www.google.com")

    # Wait a bit for the page to load
    time.sleep(2)

    # Optionally, interact with the page here, for example, find the search box
    # search_box = driver.find_element(By.NAME, "q")
    # search_box.send_keys("Selenium test")

    # Print a success message
    print(f"Successfully opened Google and interacted with the page.")

    # Save this script with the random filename
    with open(random_filename, 'w') as f:
        f.write('# This is a randomly generated test file\\n')
        f.write('# Content is not relevant to the Selenium test itself\\n')
        f.write('print(\"Hello from the random file!\")\\n')

    print(f"Random file created: {random_filename}")

finally:
    # Close the browser
    driver.quit()