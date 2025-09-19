import random
import string
import time
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.chrome.service import Service

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"selenium_test_{random_string}.py"

def create_selenium_test():
    """Create a Selenium test that opens Google"""
    # Set up Chrome options
    chrome_options = Options()
    chrome_options.add_argument("--headless")  # Run in headless mode
    chrome_options.add_argument("--no-sandbox")
    chrome_options.add_argument("--disable-dev-shm-usage")
    chrome_options.binary_location = "/usr/bin/chromium"
    
    # Set up the Chrome driver (let Selenium manage it automatically)
    driver = webdriver.Chrome(options=chrome_options)
    
    try:
        # Open Google
        print("Opening Google...")
        driver.get("https://www.google.com")
        
        # Wait for the page to load
        time.sleep(2)
        
        # Verify we're on Google by checking the title
        assert "Google" in driver.title
        print("Successfully opened Google!")
        
        # Find the search box
        search_box = driver.find_element(By.NAME, "q")
        print("Found search box")
        
        # Print page title
        print(f"Page title: {driver.title}")
        
    except Exception as e:
        print(f"An error occurred: {e}")
        
    finally:
        # Close the browser
        driver.quit()
        print("Browser closed.")

if __name__ == "__main__":
    create_selenium_test()