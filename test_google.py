from selenium import webdriver
from selenium.webdriver.common.by import By
import time

# Initialize the Chrome WebDriver
driver = webdriver.Chrome()

try:
    # Open Google
    driver.get("https://www.google.com")

    # Wait a bit to see the page load (optional)
    time.sleep(2)

    # Print title to confirm it loaded
    print(f"Page title is: {driver.title}")

finally:
    # Close the browser
    driver.quit()
