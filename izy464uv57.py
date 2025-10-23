#!/usr/bin/env python3
"""
Web Scraper for Page Titles
This script scrapes page titles from a list of URLs using BeautifulSoup.
"""

import requests
from bs4 import BeautifulSoup
import csv
import time
from urllib.parse import urljoin, urlparse

def scrape_page_title(url):
    """
    Scrape the title from a given URL
    
    Args:
        url (str): The URL to scrape
        
    Returns:
        str: The page title or an error message
    """
    try:
        # Add scheme if missing
        if not urlparse(url).scheme:
            url = 'http://' + url
            
        headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
        }
        
        response = requests.get(url, headers=headers, timeout=10)
        response.raise_for_status()
        
        soup = BeautifulSoup(response.content, 'html.parser')
        
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
    Scrape titles from multiple URLs
    
    Args:
        urls (list): List of URLs to scrape
        
    Returns:
        list: List of tuples containing (url, title)
    """
    results = []
    
    for i, url in enumerate(urls):
        print(f"Scraping {i+1}/{len(urls)}: {url}")
        title = scrape_page_title(url)
        results.append((url, title))
        
        # Be respectful and don't overwhelm servers
        time.sleep(1)
        
    return results

def save_to_csv(data, filename="scraped_titles.csv"):
    """
    Save scraped data to a CSV file
    
    Args:
        data (list): List of tuples containing (url, title)
        filename (str): Output filename
    """
    with open(filename, 'w', newline='', encoding='utf-8') as csvfile:
        writer = csv.writer(csvfile)
        writer.writerow(['URL', 'Title'])  # Header
        
        for url, title in data:
            writer.writerow([url, title])
    
    print(f"Data saved to {filename}")

def main():
    # Example URLs - replace with your target URLs
    urls = [
        "https://example.com",
        "https://httpbin.org/html",
        "https://www.python.org",
        "https://www.wikipedia.org"
    ]
    
    print("Starting to scrape page titles...")
    results = scrape_multiple_pages(urls)
    
    print("\nScraping completed! Results:")
    print("-" * 50)
    for url, title in results:
        print(f"{url} -> {title}")
    
    # Save results to CSV
    save_to_csv(results)
    
    # Also print to console in a more readable format
    print("\n" + "="*50)
    print("SUMMARY:")
    print("="*50)
    for url, title in results:
        print(f"URL: {url}")
        print(f"TITLE: {title}")
        print("-" * 50)

if __name__ == "__main__":
    main()