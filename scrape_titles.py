"""
A simple web scraper to extract page titles from a list of URLs.
Saves the results to a text file.
"""
import requests
from bs4 import BeautifulSoup

def scrape_title(url):
    """Fetches a URL and returns its HTML title."""
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes
        soup = BeautifulSoup(response.text, 'html.parser')
        title_tag = soup.find('title')
        if title_tag:
            return title_tag.get_text(strip=True)
        else:
            return "No Title Found"
    except requests.exceptions.RequestException as e:
        return f"Error fetching {url}: {e}"

def main():
    # Example list of URLs to scrape
    urls = [
        "https://httpbin.org/html",
        "https://example.com",
        "https://www.python.org",
    ]

    results = []
    for url in urls:
        title = scrape_title(url)
        results.append((url, title))
        print(f"Scraped: {url} -> {title}")

    # Save results to a file
    with open("scraped_titles.txt", "w") as f:
        for url, title in results:
            f.write(f"{url}: {title}\n")
    print("\nResults saved to 'scraped_titles.txt'.")

if __name__ == "__main__":
    main()