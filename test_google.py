from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
import time
import random
import string

# Optional: Specify the path to your ChromeDriver if it's not in PATH
# service = Service('/path/to/chromedriver')
# driver = webdriver.Chrome(service=service)

# Initialize the Chrome driver (assuming ChromeDriver is in PATH)
driver = webdriver.Chrome()

try:
    # Open Google
    driver.get("https://www.google.com")

    # Wait a bit for the page to load
    time.sleep(2)

    # Generate a random filename
    random_filename = "selenium_test_" + ''.join(random.choices(string.ascii_letters + string.digits, k=8)) + ".py"
    print(f"Saving test script as: {random_filename}")

    # Save this script under the random name
    # This is a self-replicating step. In a real scenario, you might save a different script.
    # Here, we'll just save the current script's content to the new file.
    with open(random_filename, 'w') as f:
        f.write('''from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
import time
import random
import string

# Optional: Specify the path to your ChromeDriver if it's not in PATH
# service = Service('/path/to/chromedriver')
# driver = webdriver.Chrome(service=service)

# Initialize the Chrome driver (assuming ChromeDriver is in PATH)
driver = webdriver.Chrome()

try:
    # Open Google
    driver.get("https://www.google.com")

    # Wait a bit for the page to load
    time.sleep(2)

    # Check if the title contains 'Google'
    assert "Google" in driver.title
    print("Test Passed: Successfully opened Google and verified the title.")

finally:
    # Close the browser
    driver.quit()
''')

    print(f"File '{random_filename}' has been created successfully.")

    # Example of interacting with the page: Find the search box
    search_box = driver.find_element(By.NAME, "q")
    print(f"Found search box: {search_box.tag_name}")

finally:
    # Close the browser
    driver.quit()
