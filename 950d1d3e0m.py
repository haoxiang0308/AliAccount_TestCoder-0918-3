#!/usr/bin/env python3
"""
Web Scraper for extracting page titles
This script uses BeautifulSoup to scrape page titles from URLs provided.
"""

import requests
from bs4 import BeautifulSoup
import random
import string

def scrape_page_titles(urls):
    """
    Scrape page titles from a list of URLs
    
    Args:
        urls (list): List of URLs to scrape titles from
    
    Returns:
        list: List of tuples containing (url, title)
    """
    titles = []
    
    for url in urls:
        try:
            # Add protocol if missing
            if not url.startswith(('http://', 'https://')):
                url = 'https://' + url
            
            response = requests.get(url, timeout=10)
            response.raise_for_status()  # Raise an exception for bad status codes
            
            soup = BeautifulSoup(response.content, 'html.parser')
            title_tag = soup.find('title')
            
            if title_tag:
                title = title_tag.get_text().strip()
            else:
                title = "No title found"
                
            titles.append((url, title))
            
        except requests.RequestException as e:
            print(f"Error fetching {url}: {e}")
            titles.append((url, f"Error: {e}"))
        except Exception as e:
            print(f"Error parsing {url}: {e}")
            titles.append((url, f"Error: {e}"))
    
    return titles

def generate_random_filename(extension=".py"):
    """
    Generate a random filename with the given extension
    
    Args:
        extension (str): File extension to use (default: ".py")
    
    Returns:
        str: Randomly generated filename
    """
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}{extension}"

def main():
    # Example URLs to scrape
    urls = [
        "https://httpbin.org/html",  # Test page with HTML
        "https://example.com",
        "https://httpbin.org/json"  # This might not have a title
    ]
    
    print("Scraping page titles...")
    results = scrape_page_titles(urls)
    
    print("\nScraped Titles:")
    for url, title in results:
        print(f"URL: {url}")
        print(f"Title: {title}")
        print("-" * 50)
    
    # Generate a random filename
    random_filename = generate_random_filename(".py")
    print(f"\nSaving this script to: {random_filename}")

if __name__ == "__main__":
    main()