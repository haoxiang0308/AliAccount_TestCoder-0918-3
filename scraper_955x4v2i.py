import requests
from bs4 import BeautifulSoup
import random
import string
import os

def scrape_page_titles(urls):
    """
    Scrape page titles from a list of URLs
    
    Args:
        urls (list): List of URLs to scrape titles from
    
    Returns:
        list: List of tuples containing (URL, Title)
    """
    results = []
    
    for url in urls:
        try:
            # Add protocol if missing
            if not url.startswith(('http://', 'https://')):
                url = 'https://' + url
            
            # Make a request to the URL
            response = requests.get(url, timeout=10)
            response.raise_for_status()  # Raise an exception for bad status codes
            
            # Parse the HTML content
            soup = BeautifulSoup(response.content, 'html.parser')
            
            # Find the title tag
            title_tag = soup.find('title')
            title = title_tag.text.strip() if title_tag else "No title found"
            
            results.append((url, title))
            
        except requests.RequestException as e:
            print(f"Error fetching {url}: {e}")
            results.append((url, f"Error: {e}"))
        except Exception as e:
            print(f"Error parsing {url}: {e}")
            results.append((url, f"Error: {e}"))
    
    return results

def generate_random_filename(extension=".py"):
    """Generate a random filename with the given extension"""
    random_chars = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
    return f"scraped_titles_{random_chars}{extension}"

def main():
    # Example URLs to scrape
    urls = [
        "https://httpbin.org/html",  # Test page with HTML
        "https://example.com",
        "github.com",  # Note: will be prefixed with https:// automatically
    ]
    
    print("Scraping page titles...")
    titles = scrape_page_titles(urls)
    
    # Print the results
    for url, title in titles:
        print(f"URL: {url}")
        print(f"Title: {title}")
        print("-" * 50)
    
    # Generate a random filename
    random_filename = generate_random_filename(".txt")
    
    # Save results to the randomly named file
    with open(random_filename, 'w', encoding='utf-8') as f:
        for url, title in titles:
            f.write(f"URL: {url}\n")
            f.write(f"Title: {title}\n")
            f.write("-" * 50 + "\n")
    
    print(f"Results saved to {random_filename}")

if __name__ == "__main__":
    main()