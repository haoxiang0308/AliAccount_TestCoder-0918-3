import random
import string
from selenium import webdriver
from selenium.webdriver.chrome.service import Service

def generate_random_filename(length=10):
    """Generates a random filename with a .py extension."""
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(length)) + '.py'

# Initialize the Chrome driver
driver = webdriver.Chrome()

try:
    # Navigate to Google
    driver.get('https://www.google.com')

    # Wait for a few seconds to see the page load (optional)
    driver.implicitly_wait(5)

    # Generate a random filename
    random_filename = generate_random_filename()

    # Save the current URL or a simple script to the random file
    with open(random_filename, 'w') as f:
        f.write(f'# Selenium test script saved to {random_filename}\n')
        f.write('from selenium import webdriver\n\n')
        f.write('driver = webdriver.Chrome()\n')
        f.write('driver.get("https://www.google.com")\n')
        f.write('# driver.quit() # Remember to quit the driver when done\n')

    print(f"Selenium test script saved to {random_filename}")

finally:
    # Close the browser window
    driver.quit()
