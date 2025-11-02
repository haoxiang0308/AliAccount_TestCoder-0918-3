#!/usr/bin/env python3
"""
Web Scraper for Page Titles

This script uses BeautifulSoup to scrape page titles from URLs provided by the user.
"""

import requests
from bs4 import BeautifulSoup
import random
import string

def scrape_page_title(url):
    """
    Scrape the title from a given URL
    
    Args:
        url (str): The URL to scrape
        
    Returns:
        str: The title of the page or an error message
    """
    try:
        # Add protocol if missing
        if not url.startswith(('http://', 'https://')):
            url = 'https://' + url
            
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes
        
        soup = BeautifulSoup(response.content, 'html.parser')
        title_tag = soup.find('title')
        
        if title_tag:
            return title_tag.get_text().strip()
        else:
            return "No title found"
            
    except requests.exceptions.RequestException as e:
        return f"Error fetching URL: {str(e)}"
    except Exception as e:
        return f"Error parsing page: {str(e)}"

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_chars = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
    return f"scraper_{random_chars}.py"

def main():
    print("Page Title Scraper using BeautifulSoup")
    print("=====================================")
    
    # Example URLs to scrape
    urls = [
        "https://httpbin.org/html",  # Test page
        "https://example.com",
        "https://www.python.org"
    ]
    
    print("\nScraping example URLs...")
    for url in urls:
        title = scrape_page_title(url)
        print(f"URL: {url}")
        print(f"Title: {title}\n")
    
    # Allow user to input their own URLs
    print("Enter URLs to scrape (press Enter without typing anything to finish):")
    while True:
        user_url = input("URL: ").strip()
        if not user_url:
            break
        
        title = scrape_page_title(user_url)
        print(f"Title: {title}\n")

if __name__ == "__main__":
    main()