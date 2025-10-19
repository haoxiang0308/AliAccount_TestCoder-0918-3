#!/usr/bin/env python3
"""
Web Scraper for Page Titles
This script scrapes page titles from a given URL using BeautifulSoup.
"""

import requests
from bs4 import BeautifulSoup
import random
import string

def scrape_page_titles(url):
    """
    Scrape page titles from a given URL
    
    Args:
        url (str): The URL to scrape titles from
    
    Returns:
        list: A list of page titles found on the page
    """
    try:
        # Send GET request to the URL
        headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
        }
        response = requests.get(url, headers=headers)
        response.raise_for_status()  # Raise an exception for bad status codes
        
        # Parse the HTML content
        soup = BeautifulSoup(response.content, 'html.parser')
        
        # Find all title tags
        title_tags = soup.find_all('title')
        titles = [title.get_text().strip() for title in title_tags]
        
        # Also find h1, h2, h3 tags as they often contain important titles
        heading_tags = soup.find_all(['h1', 'h2', 'h3'])
        headings = [heading.get_text().strip() for heading in heading_tags]
        
        return titles, headings
        
    except requests.exceptions.RequestException as e:
        print(f"Error fetching the URL: {e}")
        return [], []
    except Exception as e:
        print(f"An error occurred: {e}")
        return [], []

def generate_random_filename():
    """Generate a random Python filename"""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
    return f"scraped_titles_{random_string}.py"

def main():
    """Main function to run the scraper"""
    # Example URL - you can change this to any URL you want to scrape
    url = input("Enter the URL to scrape titles from: ").strip()
    
    if not url:
        print("No URL provided, using example.com as default")
        url = "https://example.com"
    
    # Ensure URL has protocol
    if not url.startswith(('http://', 'https://')):
        url = 'https://' + url
    
    print(f"Scraping titles from: {url}")
    
    titles, headings = scrape_page_titles(url)
    
    print("\n--- Page Titles Found ---")
    if titles:
        for i, title in enumerate(titles, 1):
            print(f"{i}. {title}")
    else:
        print("No <title> tags found")
    
    print("\n--- Headings Found ---")
    if headings:
        for i, heading in enumerate(headings, 1):
            print(f"{i}. {heading}")
    else:
        print("No heading tags (h1, h2, h3) found")
    
    # Save results to a file
    output_filename = generate_random_filename()
    with open(output_filename, 'w', encoding='utf-8') as f:
        f.write(f"# Scraped titles from: {url}\n")
        f.write(f"# Page Titles:\n")
        for title in titles:
            f.write(f"title_{titles.index(title)} = '{title}'\n")
        f.write(f"\n# Headings:\n")
        for heading in headings:
            f.write(f"heading_{headings.index(heading)} = '{heading}'\n")
    
    print(f"\nResults saved to: {output_filename}")

if __name__ == "__main__":
    main()