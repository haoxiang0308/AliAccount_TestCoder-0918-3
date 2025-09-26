from selenium import webdriver
from selenium.webdriver.common.by import By
import time
import random
import string

def run_selenium_test():
    # Initialize the driver (make sure you have the appropriate driver installed, e.g., chromedriver)
    driver = webdriver.Chrome() # This assumes Chrome and that chromedriver is in PATH

    try:
        # Navigate to Google
        driver.get("https://www.google.com")

        # Add a small delay to see the page load
        time.sleep(2)

        # Print title to confirm
        print(f"Page title is: {driver.title}")

    finally:
        # Close the browser
        driver.quit()

if __name__ == "__main__":
    run_selenium_test()