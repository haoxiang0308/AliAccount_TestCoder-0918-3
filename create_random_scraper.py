#!/usr/bin/env python3
"""
Script to create a randomly named Python scraper file
"""

import random
import string

def generate_random_filename():
    """
    Generate a random Python filename
    """
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

# The scraper code to be written to the random file
scraper_code = '''#!/usr/bin/env python3
"""
Web Scraper for Extracting Page Titles
This script scrapes page titles from URLs.
"""

import requests
from bs4 import BeautifulSoup

def scrape_page_title(url):
    """
    Scrape the title from a given URL
    """
    try:
        headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
        }
        response = requests.get(url, headers=headers)
        response.raise_for_status()
        
        soup = BeautifulSoup(response.text, 'html.parser')
        title_tag = soup.find('title')
        
        if title_tag:
            return title_tag.get_text().strip()
        else:
            return "No title found"
    except Exception as e:
        return f"Error scraping {url}: {str(e)}"

def main():
    # Example URLs to scrape
    urls = [
        "https://httpbin.org/html",
        "https://example.com",
        "https://httpbin.org/json"
    ]
    
    print("Scraping page titles...")
    for url in urls:
        title = scrape_page_title(url)
        print(f"URL: {url}")
        print(f"Title: {title}")
        print("-" * 50)

if __name__ == "__main__":
    main()
'''

# Generate a random filename
random_filename = generate_random_filename()

# Write the scraper code to the randomly named file
with open(random_filename, 'w') as f:
    f.write(scraper_code)

print(f"Created scraper script: {random_filename}")