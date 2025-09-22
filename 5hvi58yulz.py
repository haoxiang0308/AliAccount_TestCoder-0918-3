import requests
from bs4 import BeautifulSoup
import csv
from datetime import datetime

def scrape_page_title(url):
    """Scrape the title of a webpage"""
    try:
        # Add headers to mimic a browser request
        headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
        }
        
        # Send GET request to the URL
        response = requests.get(url, headers=headers, timeout=10)
        response.raise_for_status()  # Raise an exception for bad status codes
        
        # Parse the HTML content
        soup = BeautifulSoup(response.content, 'html.parser')
        
        # Extract the title
        title = soup.title.string if soup.title else "No title found"
        return title.strip()
    except Exception as e:
        return f"Error: {str(e)}"

def main():
    # Example URLs to scrape
    urls = [
        "https://www.python.org",
        "https://www.github.com",
        "https://stackoverflow.com",
        "https://www.wikipedia.org",
        "https://www.google.com",
        "https://www.reddit.com"
    ]
    
    # Collect results
    results = []
    print("Scraping page titles:")
    print("-" * 50)
    
    for url in urls:
        title = scrape_page_title(url)
        results.append([url, title])
        print(f"{url}: {title}")
    
    # Save results to CSV file
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    filename = f"scraped_titles_{timestamp}.csv"
    
    with open(filename, 'w', newline='', encoding='utf-8') as csvfile:
        writer = csv.writer(csvfile)
        writer.writerow(['URL', 'Title'])  # Header
        writer.writerows(results)
    
    print(f"\nResults saved to {filename}")

if __name__ == "__main__":
    main()