from selenium import webdriver
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
