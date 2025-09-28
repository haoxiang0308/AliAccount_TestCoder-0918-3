from selenium import webdriver
from selenium.webdriver.common.by import By
import time
import random
import string

# Generate a random filename
random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'

# Initialize the Chrome WebDriver
driver = webdriver.Chrome()

try:
    # Navigate to Google
    driver.get("https://www.google.com")

    # Add a small delay to see the page load (optional)
    time.sleep(2)

    # Example interaction: find the search box by its name attribute
    search_box = driver.find_element(By.NAME, "q")

    # You can interact with the search box here if needed
    # For example, search_box.send_keys("Selenium test")
    # search_box.submit()

    # Save the current script (or any content) to the random file
    # For demonstration, we'll save a simple comment
    with open(random_filename, 'w') as f:
        f.write("# This is a randomly generated Python file.\n")
        f.write(f"# It was created based on a Selenium test script interacting with Google.\n")
        f.write(f"print('Hello from {random_filename}!')\n")

    print(f"Selenium test completed. A file named '{random_filename}' has been created.")

finally:
    # Close the browser window
    driver.quit()
