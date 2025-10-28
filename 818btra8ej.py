import time
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
