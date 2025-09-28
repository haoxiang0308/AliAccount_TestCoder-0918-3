import requests
from bs4 import BeautifulSoup
import random
import string

def scrape_page_title(url):
    """Scrapes the title from a given URL."""
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

def main():
    urls = [
        "https://httpbin.org/html",
        "https://example.com",
        "https://en.wikipedia.org/wiki/Main_Page"
    ]

    for url in urls:
        title = scrape_page_title(url)
        if title:
            print(f"Title for {url}: {title}")

if __name__ == "__main__":
    main()
