#!/usr/bin/env python3
"""
Web Scraper for Page Titles
This script scrapes page titles from a given URL using BeautifulSoup.
"""

import requests
from bs4 import BeautifulSoup
import sys
import time

def scrape_page_title(url):
    """
    Scrape the title of a web page from the given URL.
    
    Args:
        url (str): The URL to scrape
        
    Returns:
        str: The page title or an error message
    """
    try:
        # Add headers to avoid being blocked by some websites
        headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
        }
        
        response = requests.get(url, headers=headers)
        response.raise_for_status()  # Raise an exception for bad status codes
        
        soup = BeautifulSoup(response.content, 'html.parser')
        
        # Find the title tag
        title_tag = soup.find('title')
        
        if title_tag:
            return title_tag.get_text().strip()
        else:
            return "No title found"
            
    except requests.exceptions.RequestException as e:
        return f"Error fetching URL: {str(e)}"
    except Exception as e:
        return f"Error parsing page: {str(e)}"

def scrape_multiple_pages(urls):
    """
    Scrape titles from multiple URLs.
    
    Args:
        urls (list): List of URLs to scrape
        
    Returns:
        dict: Dictionary mapping URLs to their titles
    """
    results = {}
    
    for url in urls:
        print(f"Scraping: {url}")
        title = scrape_page_title(url)
        results[url] = title
        print(f"Title: {title}")
        
        # Be respectful and add a small delay between requests
        time.sleep(1)
    
    return results

if __name__ == "__main__":
    # Example URLs to scrape
    urls_to_scrape = [
        "https://httpbin.org/html",  # Test page
        "https://example.com",       # Example domain
        "https://httpbin.org/json"   # Another test page
    ]
    
    print("Starting to scrape page titles...")
    print("="*50)
    
    # Scrape multiple pages
    results = scrape_multiple_pages(urls_to_scrape)
    
    print("="*50)
    print("Scraping completed!")
    
    # Save results to a text file
    with open("scraped_titles.txt", "w") as f:
        for url, title in results.items():
            f.write(f"URL: {url}\nTitle: {title}\n\n")
    
    print("Results saved to scraped_titles.txt")