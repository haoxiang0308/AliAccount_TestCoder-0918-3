from selenium import webdriver

driver = webdriver.Chrome()
driver.get("https://www.google.com")
print(f"Opened Google in {__file__}")
# driver.quit() # Remember to quit the driver when done
