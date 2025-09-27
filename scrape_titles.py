"""
A simple web scraper to extract and print the titles of web pages.
"""

import requests
from bs4 import BeautifulSoup

def scrape_page_title(url):
    """
    Fetches a web page and returns its title.

    Args:
        url (str): The URL of the web page to scrape.

    Returns:
        str: The title of the web page, or an error message.
    """
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes
        soup = BeautifulSoup(response.text, 'html.parser')
        title_tag = soup.find('title')
        if title_tag:
            return title_tag.get_text(strip=True)
        else:
            return "Title tag not found"
    except requests.exceptions.RequestException as e:
        return f"Error fetching {url}: {e}"

if __name__ == "__main__":
    # Example usage
    urls_to_scrape = [
        "https://httpbin.org/html",  # A test page with HTML content
        "https://example.com",
        "https://httpbin.org/json"   # A page unlikely to have a standard <title>
    ]

    for url in urls_to_scrape:
        title = scrape_page_title(url)
        print(f"URL: {url}\nTitle: {title}\n" + "-"*40)