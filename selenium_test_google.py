import random
import string
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
import time

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def main():
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
        
        print("Successfully opened Google!")
        print(f"Page title: {driver.title}")
        
        # Generate a random filename
        random_filename = generate_random_filename()
        print(f"Saving test code to: {random_filename}")
        
        # Save the test code to the randomly named file
        test_code = '''import time
from selenium import webdriver
from selenium.webdriver.chrome.options import Options

# Set up Chrome options
chrome_options = Options()
chrome_options.add_argument("--headless")
chrome_options.add_argument("--no-sandbox")
chrome_options.add_argument("--disable-dev-shm-usage")

# Initialize the Chrome driver
driver = webdriver.Chrome(options=chrome_options)

try:
    # Open Google
    driver.get("https://www.google.com")
    
    # Wait for page to load
    time.sleep(2)
    
    # Print page title
    print(f"Page title: {driver.title}")
    
    # Verify we're on Google
    assert "Google" in driver.title
    
finally:
    # Close the browser
    driver.quit()
'''
        
        with open(random_filename, 'w') as f:
            f.write(test_code)
        
        print(f"Test code saved to {random_filename}")
        
    finally:
        # Close the browser
        driver.quit()

if __name__ == "__main__":
    main()