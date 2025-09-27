import time
from selenium import webdriver
from selenium.webdriver.common.by import By

def test_open_google():
    driver = webdriver.Chrome()
    try:
        driver.get("https://www.google.com")
        time.sleep(2)  # Let the user see the page
    finally:
        driver.quit()

if __name__ == "__main__":
    test_open_google()
