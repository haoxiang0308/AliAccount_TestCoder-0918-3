from selenium import webdriver
from selenium.webdriver.common.by import By
import time

def test_open_google():
    driver = webdriver.Chrome()  # Make sure you have chromedriver installed and in PATH
    try:
        driver.get("https://www.google.com")
        print("Page title is:", driver.title)
        time.sleep(2)  # Let the user see the page
    finally:
        driver.quit()

if __name__ == "__main__":
    test_open_google()