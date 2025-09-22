#!/usr/bin/env python3
"""
Script to scrape page titles from a list of URLs using BeautifulSoup
"""

import requests
from bs4 import BeautifulSoup
import sys

def scrape_page_title(url):
    """
    Scrape the title of a webpage given its URL
    
    Args:
        url (str): The URL of the webpage
        
    Returns:
        str: The title of the webpage or an error message
    """
    try:
        # Add headers to mimic a browser request
        headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
        }
        
        # Send GET request to the URL
        response = requests.get(url, headers=headers, timeout=10)
        response.raise_for_status()  # Raise an exception for bad status codes
        
        # Parse the HTML content
        soup = BeautifulSoup(response.content, 'html.parser')
        
        # Extract the title
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
    # List of example URLs to scrape
    urls = [
        "https://www.python.org",
        "https://www.github.com",
        "https://stackoverflow.com",
        "https://www.wikipedia.org"
    ]
    
    print("Scraping page titles...")
    print("-" * 50)
    
    for url in urls:
        title = scrape_page_title(url)
        print(f"{url} -> {title}")

if __name__ == "__main__":
    main()