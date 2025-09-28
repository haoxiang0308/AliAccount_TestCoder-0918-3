# Data retrieved from https://jsonplaceholder.typicode.com/posts/1
import json

data = {'userId': 1, 'id': 1, 'title': 'sunt aut facere repellat provident occaecati excepturi optio reprehenderit', 'body': 'quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto'}

# Example of how to use the data
print('Data saved from API:')
print(json.dumps(data, indent=2))
