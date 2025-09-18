import random
import string
from django.shortcuts import render
from django.http import HttpResponse

def generate_random_string(length=10):
    """Generate a random string of fixed length."""
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(length))

def my_template_view(request):
    """
    A Django view that renders a template with some context data.
    """
    # Sample context data
    context = {
        'title': 'My Django Page',
        'message': 'Hello from Django!',
        'items': ['apple', 'banana', 'orange'],
        'user': {
            'name': 'John Doe',
            'authenticated': True
        }
    }
    
    # Render the template with context
    return render(request, 'my_template.html', context)

# Generate a random filename and save this view
if __name__ == "__main__":
    random_filename = generate_random_string() + ".py"
    print(f"View code would be saved in: {random_filename}")