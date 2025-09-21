import random
import string

# Generate a random filename
filename = ''.join(random.choices(string.ascii_lowercase, k=10)) + '.py'
print(filename)