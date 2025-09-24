"""
A simple web scraper to extract and print the titles of web pages.
"""

import requests
from bs4 import BeautifulSoup

def get_page_title(url):
    """
    Fetches a web page and returns its title.

    Args:
        url (str): The URL of the web page.

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
            return "No <title> tag found"
    except requests.exceptions.RequestException as e:
        return f"Error fetching {url}: {e}"

if __name__ == "__main__":
    # Example URL
    url = "https://httpbin.org/html"  # A test page that usually has a title
    title = get_page_title(url)
    print(f"Title of {url}: {title}")
