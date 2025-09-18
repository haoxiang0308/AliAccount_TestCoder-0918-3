from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.chrome.service import Service
import time
import random
import string
import os

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_chars = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"test_{random_chars}.py"

def main():
    # Set up Chrome options for headless browsing
    chrome_options = Options()
    chrome_options.add_argument("--headless")  # Run in headless mode
    chrome_options.add_argument("--no-sandbox")  # Bypass OS security model
    chrome_options.add_argument("--disable-dev-shm-usage")  # Overcome limited resource problems
    chrome_options.add_argument("--disable-gpu")  # Applicable to windows os only
    chrome_options.add_argument("--window-size=1920,1080")  # Set window size
    chrome_options.add_argument("--disable-extensions")  # Disable extensions
    chrome_options.add_argument("--disable-plugins")  # Disable plugins
    chrome_options.binary_location = "/usr/bin/chromium"  # Specify Chromium binary location
    
    # Specify ChromeDriver location
    service = Service("/usr/local/bin/chromedriver")
    
    # Initialize the Chrome driver with options and service
    driver = webdriver.Chrome(service=service, options=chrome_options)
    
    try:
        print("Opening Google...")
        # Open Google
        driver.get("https://www.google.com")
        
        # Wait for page to load
        time.sleep(3)
        
        # Verify we're on Google by checking the title
        assert "Google" in driver.title
        print("Successfully opened Google")
        print(f"Page title: {driver.title}")
        
        # Optional: Search for something
        # search_box = driver.find_element(By.NAME, "q")
        # search_box.send_keys("Selenium test")
        # search_box.submit()
        
    except Exception as e:
        print(f"An error occurred: {e}")
        
    finally:
        # Close the browser
        driver.quit()

if __name__ == "__main__":
    main()