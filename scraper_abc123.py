import requests
from bs4 import BeautifulSoup

def scrape_page_title(url):
    """Scrapes the title from a given URL."""
    try:
        response = requests.get(url)
        response.raise_for_status() # Raises an HTTPError for bad responses
        soup = BeautifulSoup(response.text, 'html.parser')
        title_tag = soup.find('title')
        if title_tag:
            return title_tag.get_text(strip=True)
        else:
            return "No title tag found"
    except requests.exceptions.RequestException as e:
        return f"Error fetching the URL: {e}"

if __name__ == "__main__":
    url_to_scrape = input("Enter the URL to scrape the title from: ")
    title = scrape_page_title(url_to_scrape)
    print(f"The title of the page is: {title}")