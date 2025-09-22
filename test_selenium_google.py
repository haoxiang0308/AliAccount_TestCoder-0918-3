import secrets
import string
import time
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.firefox.options import Options
from webdriver_manager.firefox import GeckoDriverManager
from selenium.webdriver.firefox.service import Service

def generate_random_filename(length=10):
    """Generate a random filename with specified length"""
    chars = string.ascii_lowercase + string.digits
    random_string = ''.join(secrets.choice(chars) for _ in range(length))
    return f"selenium_test_{random_string}.py"

def main():
    # Set up Firefox options
    firefox_options = Options()
    firefox_options.add_argument("--headless")  # Run in headless mode
    
    # Initialize the Firefox driver with WebDriver Manager
    service = Service(GeckoDriverManager().install())
    driver = webdriver.Firefox(service=service, options=firefox_options)
    
    try:
        # Open Google
        driver.get("https://www.google.com")
        
        # Wait for page to load
        time.sleep(2)
        
        # Verify we're on Google by checking the title
        assert "Google" in driver.title
        print("Successfully opened Google!")
        print(f"Page title: {driver.title}")
        
        # Generate a random filename and save this script
        filename = generate_random_filename()
        with open(filename, 'w') as f:
            f.write(open(__file__).read())
        
        print(f"Test saved to: {filename}")
        
    except Exception as e:
        print(f"An error occurred: {e}")
    finally:
        # Close the browser
        driver.quit()

if __name__ == "__main__":
    main()