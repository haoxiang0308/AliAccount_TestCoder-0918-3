#!/usr/bin/env python3
"""
Web scraper to extract page titles from URLs using BeautifulSoup.
This script will be renamed to a random name.
"""

import requests
from bs4 import BeautifulSoup
import random
import string
from urllib.parse import urlparse


def get_page_title(url):
    """
    Fetches the title of a webpage from the given URL.
    
    Args:
        url (str): The URL to fetch the title from
        
    Returns:
        str: The title of the webpage or an error message
    """
    try:
        # Add protocol if missing
        if not url.startswith(('http://', 'https://')):
            url = 'https://' + url
        
        headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
        }
        
        response = requests.get(url, headers=headers, timeout=10)
        response.raise_for_status()  # Raise an exception for bad status codes
        
        soup = BeautifulSoup(response.content, 'html.parser')
        
        # Find the title tag
        title_tag = soup.find('title')
        
        if title_tag:
            return title_tag.get_text().strip()
        else:
            return f"No title found for {url}"
            
    except requests.exceptions.RequestException as e:
        return f"Error fetching {url}: {str(e)}"
    except Exception as e:
        return f"Error parsing {url}: {str(e)}"


def generate_random_filename(extension=".py"):
    """
    Generates a random filename with the given extension.
    
    Args:
        extension (str): The file extension to use (default: ".py")
        
    Returns:
        str: A random filename
    """
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return random_name + extension


def scrape_multiple_pages(urls):
    """
    Scrapes titles from multiple URLs.
    
    Args:
        urls (list): List of URLs to scrape titles from
        
    Returns:
        list: List of tuples containing (url, title)
    """
    results = []
    
    for url in urls:
        print(f"Scraping: {url}")
        title = get_page_title(url)
        results.append((url, title))
        print(f"Title: {title}")
        print("-" * 50)
    
    return results


def save_results_to_file(results, filename="scraped_titles.txt"):
    """
    Saves the scraped titles to a text file.
    
    Args:
        results (list): List of tuples containing (url, title)
        filename (str): Name of the file to save results to
    """
    with open(filename, 'w', encoding='utf-8') as f:
        for url, title in results:
            f.write(f"URL: {url}\n")
            f.write(f"Title: {title}\n")
            f.write("-" * 50 + "\n")
    
    print(f"Results saved to {filename}")


if __name__ == "__main__":
    # Example URLs to scrape
    urls_to_scrape = [
        "https://www.python.org",
        "https://www.wikipedia.org",
        "https://www.github.com"
    ]
    
    print("Starting web scraping for page titles...\n")
    
    # Scrape titles from the URLs
    scraped_results = scrape_multiple_pages(urls_to_scrape)
    
    # Save results to a file
    save_results_to_file(scraped_results, "scraped_titles.txt")
    
    # Generate a random filename for this script
    random_script_name = generate_random_filename(".py")
    print(f"\nIf this script were to be renamed, it would be: {random_script_name}")