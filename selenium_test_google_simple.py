import random
import string
import os

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def main():
    print("Creating Selenium test for Google...")
    
    # Generate a random filename
    random_filename = generate_random_filename()
    print(f"Creating test file: {random_filename}")
    
    # Create the test code that would open Google with Selenium
    test_code = '''import time
from selenium import webdriver
from selenium.webdriver.chrome.options import Options

def test_open_google():
    # Set up Chrome options (headless mode for environments without display)
    chrome_options = Options()
    chrome_options.add_argument("--headless")  # Run in headless mode
    chrome_options.add_argument("--no-sandbox")
    chrome_options.add_argument("--disable-dev-shm-usage")

    # Initialize the Chrome driver
    driver = webdriver.Chrome(options=chrome_options)

    try:
        # Open Google
        driver.get("https://www.google.com")
        
        # Wait a bit to ensure the page loads
        time.sleep(2)
        
        # Verify we're on the Google page
        assert "Google" in driver.title
        print(f"Successfully opened Google! Page title: {driver.title}")
        
    finally:
        # Close the browser
        driver.quit()

if __name__ == "__main__":
    test_open_google()
'''
    
    # Write the test code to the randomly named file
    with open(random_filename, 'w') as f:
        f.write(test_code)
    
    print(f"Selenium test code saved to {random_filename}")
    print("The test would open Google in a browser when run in an environment with Chrome and ChromeDriver installed.")

if __name__ == "__main__":
    main()