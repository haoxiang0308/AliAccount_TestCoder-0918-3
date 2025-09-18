import random
import string
import os

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_chars = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"test_{random_chars}.py"

def main():
    # Create a simple Selenium test script
    test_script = '''from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.chrome.service import Service
import time

def test_google():
    """Simple test to open Google"""
    # Set up Chrome options for headless browsing
    chrome_options = Options()
    chrome_options.add_argument("--headless")
    chrome_options.add_argument("--no-sandbox")
    chrome_options.add_argument("--disable-dev-shm-usage")
    chrome_options.binary_location = "/usr/bin/chromium"
    
    # Specify ChromeDriver location
    service = Service("/usr/local/bin/chromedriver")
    
    # Initialize the Chrome driver
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
        
    except Exception as e:
        print(f"An error occurred: {e}")
        
    finally:
        # Close the browser
        driver.quit()

if __name__ == "__main__":
    test_google()
'''
    
    # Generate a random filename
    filename = generate_random_filename()
    
    # Save the test script to the file
    with open(filename, 'w') as f:
        f.write(test_script)
    
    print(f"Saved Selenium test to {filename}")

if __name__ == "__main__":
    main()