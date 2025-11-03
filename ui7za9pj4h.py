#!/usr/bin/env python3
"""
Web scraper to extract page titles from URLs using BeautifulSoup.
Saves the results to a text file.
"""
import requests
from bs4 import BeautifulSoup
import random
import string
from urllib.parse import urlparse


def generate_random_filename(extension=".txt"):
    """Generate a random filename with the specified extension."""
    letters = string.ascii_lowercase + string.digits
    random_part = ''.join(random.choice(letters) for _ in range(10))
    return f"scraped_titles_{random_part}{extension}"


def scrape_page_title(url):
    """
    Scrape the title from a single webpage.
    
    Args:
        url (str): The URL to scrape
        
    Returns:
        str: The page title or an error message
    """
    try:
        headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
        }
        response = requests.get(url, headers=headers, timeout=10)
        response.raise_for_status()  # Raise an exception for bad status codes
        
        soup = BeautifulSoup(response.content, 'html.parser')
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
        urls (list): List of URLs to scrape
        
    Returns:
        list: List of tuples containing (url, title)
    """
    results = []
    for url in urls:
        print(f"Scraping: {url}")
        title = scrape_page_title(url)
        results.append((url, title))
        print(f"Title: {title}")
        print("-" * 50)
    
    return results


def save_results_to_file(results, filename=None):
    """
    Save the scraped titles to a file.
    
    Args:
        results (list): List of tuples containing (url, title)
        filename (str): Name of the file to save results to. If None, generates a random name.
    """
    if filename is None:
        filename = generate_random_filename(".txt")
    
    with open(filename, 'w', encoding='utf-8') as f:
        f.write("Scraped Page Titles\n")
        f.write("=" * 50 + "\n\n")
        for url, title in results:
            f.write(f"URL: {url}\n")
            f.write(f"Title: {title}\n")
            f.write("-" * 50 + "\n")
    
    print(f"Results saved to: {filename}")
    return filename


def main():
    # Example URLs to scrape - you can modify this list
    urls = [
        "https://httpbin.org/html",  # Test page with HTML
        "https://example.com",       # Example domain
        "https://httpbin.org/json"   # This will likely have no title
    ]
    
    print("Starting web scraping...")
    results = scrape_multiple_pages(urls)
    
    # Save results to a randomly named file
    filename = save_results_to_file(results)
    
    print(f"\nScraping completed! Results saved to {filename}")


if __name__ == "__main__":
    main()