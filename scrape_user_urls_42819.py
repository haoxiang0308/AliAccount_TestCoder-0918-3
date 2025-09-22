#!/usr/bin/env python3
"""
Script to scrape page titles from user-provided URLs using BeautifulSoup
"""

import requests
from bs4 import BeautifulSoup
import time

def get_page_title(url):
    """
    Fetches and returns the title of a webpage.
    
    Args:
        url (str): The URL of the webpage.
        
    Returns:
        str: The title of the webpage or an error message.
    """
    try:
        # Add a more comprehensive user agent to avoid being blocked
        headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36'
        }
        
        # Send a GET request to the URL
        response = requests.get(url, headers=headers, timeout=15)
        response.raise_for_status()  # Raise an exception for bad status codes
        
        # Parse the HTML content
        soup = BeautifulSoup(response.content, 'html.parser')
        
        # Find the title tag and extract its text
        title_tag = soup.find('title')
        if title_tag:
            return title_tag.get_text().strip()
        else:
            return "No title found"
            
    except requests.exceptions.RequestException as e:
        return f"Error fetching URL: {e}"
    except Exception as e:
        return f"Error parsing page: {e}"

def main():
    print("Web Page Title Scraper")
    print("=" * 30)
    
    # Get URLs from user
    urls = []
    print("Enter URLs to scrape (press Enter with empty input to finish):")
    while True:
        url = input("URL: ").strip()
        if not url:
            break
        # Add protocol if missing
        if not url.startswith(("http://", "https://")):
            url = "https://" + url
        urls.append(url)
    
    if not urls:
        print("No URLs provided. Exiting.")
        return
    
    print("\nScraping page titles...")
    print("-" * 50)
    
    # Scrape each URL
    for url in urls:
        print(f"URL: {url}")
        title = get_page_title(url)
        print(f"Title: {title}")
        print("-" * 50)
        
        # Be respectful - add a small delay between requests
        time.sleep(2)

if __name__ == "__main__":
    main()