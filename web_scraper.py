#!/usr/bin/env python3
"""
Web Scraper for Page Titles
This script uses BeautifulSoup to scrape the title of a webpage.
"""

import requests
from bs4 import BeautifulSoup
import sys
import secrets
import string


def generate_random_filename(length=10):
    """Generate a random filename with specified length."""
    chars = string.ascii_lowercase + string.digits
    return ''.join(secrets.choice(chars) for _ in range(length)) + '.py'


def scrape_page_title(url):
    """
    Scrape the title of a webpage.
    
    Args:
        url (str): The URL of the webpage to scrape.
        
    Returns:
        str: The title of the webpage or an error message.
    """
    try:
        # Send GET request to the URL
        response = requests.get(url, timeout=10)
        response.raise_for_status()  # Raise an exception for bad status codes
        
        # Parse the HTML content
        soup = BeautifulSoup(response.content, 'html.parser')
        
        # Extract the title
        title = soup.title.string if soup.title else "No title found"
        
        return title.strip()
    except requests.RequestException as e:
        return f"Error fetching the webpage: {e}"
    except Exception as e:
        return f"Error parsing the webpage: {e}"


def main():
    """Main function to run the scraper."""
    if len(sys.argv) != 2:
        print("Usage: python scraper.py <URL>")
        sys.exit(1)
    
    url = sys.argv[1]
    print(f"Scraping title from: {url}")
    
    title = scrape_page_title(url)
    print(f"Page Title: {title}")


if __name__ == "__main__":
    # If run directly, generate a random filename and save this script
    if len(sys.argv) == 1:
        random_filename = generate_random_filename()
        with open(random_filename, 'w') as f:
            f.write(open(__file__).read())
        print(f"Script saved as: {random_filename}")
    else:
        main()