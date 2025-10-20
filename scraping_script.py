import requests
from bs4 import BeautifulSoup
import random
import string

def scrape_page_titles(urls):
    """
    Scrape page titles from a list of URLs
    """
    titles = []
    
    for url in urls:
        try:
            # Send GET request to the URL
            response = requests.get(url)
            response.raise_for_status()  # Raise an exception for bad status codes
            
            # Parse the HTML content
            soup = BeautifulSoup(response.text, 'html.parser')
            
            # Find the title tag
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

def generate_random_filename():
    """
    Generate a random filename with .py extension
    """
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def main():
    # Example URLs to scrape
    urls = [
        'https://httpbin.org/html',  # Test page with HTML
        'https://example.com',
        'https://httpbin.org/json'   # This might not have a title
    ]
    
    print("Scraping page titles...")
    results = scrape_page_titles(urls)
    
    print("\nScraped titles:")
    for item in results:
        print(f"URL: {item['url']}")
        print(f"Title: {item['title']}\n")
    
    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Create a new script file with the random name
    script_content = f'''# Auto-generated script to scrape page titles
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
                titles.append({{'url': url, 'title': title}})
            else:
                titles.append({{'url': url, 'title': 'No title found'}})
                
        except requests.RequestException as e:
            print(f"Error fetching {{url}}: {{e}}")
            titles.append({{'url': url, 'title': f'Error: {{e}}'}})
        except Exception as e:
            print(f"Error parsing {{url}}: {{e}}")
            titles.append({{'url': url, 'title': f'Error: {{e}}'}})
    
    return titles

# Example usage
urls = {urls}
results = scrape_page_titles(urls)

print("Scraped titles:")
for item in results:
    print(f"URL: {{item['url']}}")
    print(f"Title: {{item['title']}}\\n")
'''
    
    with open(random_filename, 'w') as f:
        f.write(script_content)
    
    print(f"New script saved as: {random_filename}")

if __name__ == "__main__":
    main()