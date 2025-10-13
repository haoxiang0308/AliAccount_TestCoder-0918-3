"""
A simple web scraper to extract and print the titles of web pages.
"""
import requests
from bs4 import BeautifulSoup

def get_page_title(url):
    """Fetches the title of a given webpage."""
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes
        soup = BeautifulSoup(response.text, 'html.parser')
        title_tag = soup.find('title')
        if title_tag:
            return title_tag.get_text(strip=True)
        else:
            return "No title found"
    except requests.exceptions.RequestException as e:
        print(f"Error fetching {url}: {e}")
        return None

if __name__ == "__main__":
    urls = [
        "https://www.example.com",
        "https://www.python.org",
        "https://www.github.com"
    ]

    for url in urls:
        title = get_page_title(url)
        if title:
            print(f"Title of {url}: {title}")