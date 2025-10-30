import random
import string
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.chrome.service import Service
import time

def run_selenium_test():
    # Set up Chrome options (optional - for headless mode or other configurations)
    chrome_options = Options()
    # chrome_options.add_argument("--headless")  # Uncomment to run in headless mode
    
    # Initialize the Chrome driver with ChromeDriverManager
    service = Service(ChromeDriverManager().install())
    driver = webdriver.Chrome(service=service, options=chrome_options)
    
    try:
        # Open Google
        driver.get("https://www.google.com")
        
        # Wait for the page to load
        time.sleep(3)
        
        # Print the title of the page to confirm it loaded
        print(f"Page title: {driver.title}")
        
        # You can add more interactions here if needed
        # For example, find the search box:
        # search_box = driver.find_element(By.NAME, "q")
        
    finally:
        # Close the browser
        driver.quit()

# Generate a random filename
def generate_random_filename():
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

# Create the Selenium test file with a random name
if __name__ == "__main__":
    # Create a file with random name containing the test code
    random_filename = generate_random_filename()
    
    selenium_code = '''from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.chrome.service import Service
import time

def test_open_google():
    chrome_options = Options()
    chrome_options.add_argument("--headless")  # Run in headless mode to avoid display issues
    
    service = Service(ChromeDriverManager().install())
    driver = webdriver.Chrome(service=service, options=chrome_options)
    
    try:
        driver.get("https://www.google.com")
        time.sleep(3)
        print(f"Page title: {driver.title}")
    finally:
        driver.quit()

if __name__ == "__main__":
    test_open_google()
'''
    
    with open(random_filename, 'w') as f:
        f.write(selenium_code)
    
    print(f"Selenium test saved to: {random_filename}")