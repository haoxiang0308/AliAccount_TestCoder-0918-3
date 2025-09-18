import requests
from bs4 import BeautifulSoup
import random
import string
import datetime

def generate_random_filename(length=8):
    """Generate a random filename with .txt extension"""
    letters = string.ascii_lowercase
    random_name = ''.join(random.choice(letters) for i in range(length))
    return random_name + ".txt"

def scrape_page_title(url):
    """Scrape the title of a webpage"""
    try:
        # Add headers to avoid being blocked by some websites
        headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
        }
        response = requests.get(url, headers=headers, timeout=10)
        response.raise_for_status()
        soup = BeautifulSoup(response.content, 'html.parser')
        title = soup.title.string if soup.title else "No title found"
        return title.strip()
    except Exception as e:
        return f"Error scraping {url}: {str(e)}"

def save_results_to_file(results, filename):
    """Save scraping results to a file"""
    with open(filename, 'w', encoding='utf-8') as f:
        f.write(f"Web Scraping Results - {datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n")
        f.write("=" * 50 + "\n\n")
        for url, title in results.items():
            f.write(f"URL: {url}\n")
            f.write(f"Title: {title}\n")
            f.write("-" * 30 + "\n")
    print(f"Results saved to {filename}")

def main():
    # Example URLs to scrape
    urls = [
        "https://www.python.org",
        "https://www.github.com",
        "https://www.stackoverflow.com",
        "https://www.wikipedia.org"
    ]
    
    print("Scraping page titles...")
    print("-" * 40)
    
    # Dictionary to store results
    results = {}
    
    for url in urls:
        title = scrape_page_title(url)
        results[url] = title
        print(f"{url} -> {title}")
    
    # Generate a random filename and save results
    output_filename = generate_random_filename()
    save_results_to_file(results, output_filename)

if __name__ == "__main__":
    main()