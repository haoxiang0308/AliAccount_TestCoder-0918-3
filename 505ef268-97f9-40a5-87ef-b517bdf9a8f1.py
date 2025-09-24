from selenium import webdriver
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
