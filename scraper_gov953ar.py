#!/usr/bin/env python3
"""
Web Scraper for Page Titles
This script scrapes page titles from a given URL using BeautifulSoup.
"""

import requests
from bs4 import BeautifulSoup
import sys
import time


def scrape_page_titles(urls):
    """
    Scrape page titles from a list of URLs
    
    Args:
        urls: List of URLs or single URL string
    
    Returns:
        List of tuples containing (URL, Title)
    """
    if isinstance(urls, str):
        urls = [urls]
    
    results = []
    
    for url in urls:
        try:
            # Add protocol if missing
            if not url.startswith(('http://', 'https://')):
                url = 'https://' + url
            
            # Make the request
            headers = {
                'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
            }
            response = requests.get(url, headers=headers, timeout=10)
            response.raise_for_status()
            
            # Parse the HTML
            soup = BeautifulSoup(response.text, 'html.parser')
            
            # Find the title tag
            title_tag = soup.find('title')
            title = title_tag.get_text().strip() if title_tag else "No title found"
            
            results.append((url, title))
            print(f"Title for {url}: {title}")
            
        except requests.exceptions.RequestException as e:
            error_msg = f"Error fetching {url}: {str(e)}"
            results.append((url, error_msg))
            print(error_msg)
        except Exception as e:
            error_msg = f"Error parsing {url}: {str(e)}"
            results.append((url, error_msg))
            print(error_msg)
    
    return results


def save_results_to_file(results, filename="scraped_titles.txt"):
    """
    Save the scraping results to a text file
    
    Args:
        results: List of tuples (URL, Title)
        filename: Output filename
    """
    with open(filename, 'w', encoding='utf-8') as f:
        f.write("Scraped Page Titles\n")
        f.write("=" * 50 + "\n")
        for url, title in results:
            f.write(f"URL: {url}\n")
            f.write(f"Title: {title}\n")
            f.write("-" * 50 + "\n")
    
    print(f"\nResults saved to {filename}")


def main():
    # Example URLs to scrape
    urls_to_scrape = [
        "https://httpbin.org/html",  # Test page
        "https://example.com",
        "https://httpbin.org/robots.txt"  # This will likely have no title
    ]
    
    print("Starting to scrape page titles...")
    results = scrape_page_titles(urls_to_scrape)
    
    # Save results to a file
    save_results_to_file(results)
    
    print("\nScraping completed!")


if __name__ == "__main__":
    main()