import random
import string

# Define the content of the Selenium test
selenium_test_content = '''from selenium import webdriver
from selenium.webdriver.common.by import By
import time

driver = webdriver.Chrome()
try:
    driver.get("https://www.google.com")
    time.sleep(2)
    assert "Google" in driver.title
    print("Test Passed: Successfully opened Google and verified the title.")
    search_box = driver.find_element(By.NAME, "q")
    search_box.send_keys("Selenium test")
    time.sleep(1)
finally:
    driver.quit()
'''

# Generate a random filename
random_filename = "selenium_test_" + ''.join(random.choices(string.ascii_letters + string.digits, k=8)) + ".py"

# Write the content to the randomly named file
with open(random_filename, 'w') as f:
    f.write(selenium_test_content)

print(f"Selenium test script saved as: {random_filename}")
