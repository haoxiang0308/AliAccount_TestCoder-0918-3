import random
import string
import os
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def create_selenium_test():
    """Create the selenium test script content"""
    script_content = '''from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
import time

def test_open_google():
    # Setup Chrome options
    chrome_options = Options()
    chrome_options.add_argument("--no-sandbox")
    chrome_options.add_argument("--disable-dev-shm-usage")
    
    # Initialize the Chrome driver
    driver = webdriver.Chrome(options=chrome_options)
    
    try:
        # Open Google
        driver.get("https://www.google.com")
        
        # Wait for page to load
        time.sleep(3)
        
        # Verify we're on Google by checking the title
        assert "Google" in driver.title
        
        print("Successfully opened Google!")
        print(f"Page title: {driver.title}")
        
    except Exception as e:
        print(f"Error occurred: {e}")
        
    finally:
        # Close the browser
        driver.quit()

if __name__ == "__main__":
    test_open_google()
'''
    return script_content

def main():
    # Generate random filename
    filename = generate_random_filename()
    
    # Create the selenium test content
    content = create_selenium_test()
    
    # Write to file
    with open(filename, 'w') as f:
        f.write(content)
    
    print(f"Created Selenium test file: {filename}")

if __name__ == "__main__":
    main()