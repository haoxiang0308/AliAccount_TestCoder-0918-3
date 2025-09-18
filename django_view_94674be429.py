import random
import string
from django.shortcuts import render
from django.http import HttpResponse

def generate_random_string(length=10):
    """Generate a random string of fixed length"""
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(length))

def my_template_view(request):
    """
    A Django view that renders a template with some context data
    """
    context = {
        'random_string': generate_random_string(),
        'message': 'Hello from Django view!',
        'items': ['apple', 'banana', 'cherry']
    }
    return render(request, 'my_template.html', context)

def another_view(request):
    """
    Another example view that returns a simple HttpResponse
    """
    return HttpResponse("This is another view in the same file.")