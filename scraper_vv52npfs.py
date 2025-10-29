#!/usr/bin/env python3
"""
Simple Web Scraper for Page Titles

This script uses BeautifulSoup to scrape page titles from a list of URLs.
"""

import requests
from bs4 import BeautifulSoup


def scrape_page_titles(urls):
    """
    Scrape page titles from a list of URLs.
    
    Args:
        urls (list): List of URLs to scrape titles from
    
    Returns:
        dict: Dictionary mapping URLs to their titles
    """
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
    }
    
    results = {}
    
    for url in urls:
        try:
            response = requests.get(url, headers=headers, timeout=10)
            response.raise_for_status()
            
            soup = BeautifulSoup(response.content, 'html.parser')
            title_tag = soup.find('title')
            
            if title_tag:
                title = title_tag.get_text().strip()
            else:
                title = "No title found"
                
            results[url] = title
            print(f"URL: {url}")
            print(f"Title: {title}\n")
            
        except Exception as e:
            error_msg = f"Error: {str(e)}"
            results[url] = error_msg
            print(f"URL: {url}")
            print(f"{error_msg}\n")
    
    return results


def main():
    # List of sample URLs to scrape
    urls = [
        "https://example.com",
        "https://httpbin.org/html",
        "https://www.python.org"
    ]
    
    print("Scraping page titles...\n")
    
    # Scrape the titles
    titles = scrape_page_titles(urls)
    
    # Optionally save to file
    with open('scraped_titles_output.txt', 'w') as f:
        for url, title in titles.items():
            f.write(f"URL: {url}\nTitle: {title}\n\n")
    
    print("Results also saved to 'scraped_titles_output.txt'")


if __name__ == "__main__":
    main()