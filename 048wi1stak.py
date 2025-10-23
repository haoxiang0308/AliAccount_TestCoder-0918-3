from django.shortcuts import render
from django.http import HttpResponse
import random
import string


def random_template_view(request):
    """
    A Django view that renders a template.
    This view generates some random data to pass to the template context.
    """
    # Generate some random data to pass to the template
    random_data = {
        'title': 'Random Template View',
        'random_number': random.randint(1, 100),
        'random_string': ''.join(random.choices(string.ascii_letters + string.digits, k=10)),
        'items': ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5']
    }
    
    # Render the template with context data
    return render(request, 'random_template.html', random_data)


def simple_template_view(request):
    """
    A simple Django view that renders a basic template.
    """
    context = {
        'message': 'Hello from the Django view!',
        'page_title': 'Django Template View'
    }
    
    return render(request, 'simple_template.html', context)