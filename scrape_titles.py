#!/usr/bin/env python3
"""
Web Scraper for Page Titles

This script uses BeautifulSoup to scrape page titles from URLs provided by the user
or from a list of predefined URLs. It saves the results to a file.
"""

import requests
from bs4 import BeautifulSoup
import random
import string
from urllib.parse import urlparse


def generate_random_filename():
    """Generate a random filename with .py extension."""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"scraped_titles_{random_string}.txt"


def scrape_page_title(url):
    """Scrape the title from a given URL."""
    try:
        # Add headers to avoid being blocked by some websites
        headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
        }
        
        response = requests.get(url, headers=headers, timeout=10)
        response.raise_for_status()  # Raise an exception for bad status codes
        
        soup = BeautifulSoup(response.content, 'html.parser')
        
        # Find the title tag
        title_tag = soup.find('title')
        if title_tag:
            title = title_tag.get_text().strip()
        else:
            title = "No title found"
        
        return title
    except requests.RequestException as e:
        print(f"Error fetching {url}: {str(e)}")
        return None
    except Exception as e:
        print(f"Error parsing {url}: {str(e)}")
        return None


def scrape_multiple_pages(urls):
    """Scrape titles from multiple URLs."""
    results = {}
    for url in urls:
        print(f"Scraping: {url}")
        title = scrape_page_title(url)
        if title:
            results[url] = title
        else:
            results[url] = "Failed to retrieve title"
    return results


def save_results_to_file(results, filename):
    """Save the scraped results to a file."""
    with open(filename, 'w', encoding='utf-8') as f:
        for url, title in results.items():
            f.write(f"URL: {url}\nTitle: {title}\n\n")
    print(f"Results saved to {filename}")


def main():
    # Example URLs to scrape
    urls = [
        "https://httpbin.org/html",  # Simple test page
        "https://example.com",
        "https://www.python.org",
        "https://github.com",
        "https://stackoverflow.com"
    ]
    
    print("Starting to scrape page titles...")
    
    # Scrape titles from the example URLs
    results = scrape_multiple_pages(urls)
    
    # Generate a random filename for the results
    results_filename = generate_random_filename()
    
    # Save results to the file
    save_results_to_file(results, results_filename)
    
    # Print results to console as well
    print("\nScraped Results:")
    print("-" * 50)
    for url, title in results.items():
        print(f"URL: {url}")
        print(f"Title: {title}")
        print("-" * 50)


if __name__ == "__main__":
    main()