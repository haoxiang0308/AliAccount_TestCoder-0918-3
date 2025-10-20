#!/usr/bin/env python3
"""
A Python script that scrapes page titles from URLs using BeautifulSoup.
This script demonstrates web scraping functionality by extracting titles from web pages.
"""

import requests
from bs4 import BeautifulSoup
import sys
import time
import random


def scrape_page_title(url):
    """
    Scrape the title from a given URL.
    
    Args:
        url (str): The URL to scrape
        
    Returns:
        str: The title of the page or an error message
    """
    try:
        # Add headers to mimic a real browser request
        headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
        }
        
        response = requests.get(url, headers=headers)
        response.raise_for_status()  # Raise an exception for bad status codes
        
        soup = BeautifulSoup(response.text, 'html.parser')
        
        # Find the title tag
        title_tag = soup.find('title')
        
        if title_tag:
            return title_tag.get_text().strip()
        else:
            return "No title found"
            
    except requests.RequestException as e:
        return f"Error fetching URL: {str(e)}"
    except Exception as e:
        return f"Error parsing page: {str(e)}"


def scrape_multiple_pages(urls):
    """
    Scrape titles from multiple URLs.
    
    Args:
        urls (list): A list of URLs to scrape
        
    Returns:
        dict: A dictionary mapping URLs to their titles
    """
    results = {}
    
    for url in urls:
        print(f"Scraping: {url}")
        title = scrape_page_title(url)
        results[url] = title
        
        # Be respectful and add a small delay between requests
        time.sleep(random.uniform(0.5, 1.5))
        
    return results


def main():
    """
    Main function to demonstrate the web scraping functionality.
    """
    print("Page Title Scraper using BeautifulSoup")
    print("=" * 40)
    
    # Example URLs - in a real scenario, these might come from user input or a file
    test_urls = [
        "https://httpbin.org/html",  # A test page that returns HTML
        "https://example.com",       # A simple example page
    ]
    
    print(f"Scraping titles from {len(test_urls)} URLs...\n")
    
    results = scrape_multiple_pages(test_urls)
    
    print("\nResults:")
    print("-" * 40)
    for url, title in results.items():
        print(f"URL: {url}")
        print(f"Title: {title}")
        print("-" * 40)
    
    # Save results to a file
    with open("scraped_titles.txt", "w", encoding="utf-8") as f:
        for url, title in results.items():
            f.write(f"URL: {url}\n")
            f.write(f"Title: {title}\n")
            f.write("-" * 40 + "\n")
    
    print("Results saved to 'scraped_titles.txt'")


if __name__ == "__main__":
    main()