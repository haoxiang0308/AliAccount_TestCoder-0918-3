# Auto-generated script to scrape page titles
import requests
from bs4 import BeautifulSoup

def scrape_page_titles(urls):
    """
    Scrape page titles from a list of URLs
    """
    titles = []
    
    for url in urls:
        try:
            response = requests.get(url)
            response.raise_for_status()
            
            soup = BeautifulSoup(response.text, 'html.parser')
            title_tag = soup.find('title')
            
            if title_tag:
                title = title_tag.get_text().strip()
                titles.append({'url': url, 'title': title})
            else:
                titles.append({'url': url, 'title': 'No title found'})
                
        except requests.RequestException as e:
            print(f"Error fetching {url}: {e}")
            titles.append({'url': url, 'title': f'Error: {e}'})
        except Exception as e:
            print(f"Error parsing {url}: {e}")
            titles.append({'url': url, 'title': f'Error: {e}'})
    
    return titles

# Example usage
urls = ['https://httpbin.org/html', 'https://example.com', 'https://httpbin.org/json']
results = scrape_page_titles(urls)

print("Scraped titles:")
for item in results:
    print(f"URL: {item['url']}")
    print(f"Title: {item['title']}\n")
