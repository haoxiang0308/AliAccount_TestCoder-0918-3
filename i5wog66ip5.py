from django.shortcuts import render
from django.http import HttpResponse

def sample_view(request):
    """
    A sample Django view that renders a template.
    """
    context = {
        'title': 'Sample Page',
        'content': 'This is a sample page rendered by a Django view.',
        'items': ['Item 1', 'Item 2', 'Item 3']
    }
    return render(request, 'sample_template.html', context)

# Alternative view example with more functionality
def another_view(request):
    """
    Another example Django view with more functionality.
    """
    if request.method == 'GET':
        # Handle GET request
        context = {
            'message': 'Hello from Django!',
            'page_type': 'GET'
        }
        return render(request, 'another_template.html', context)
    elif request.method == 'POST':
        # Handle POST request
        context = {
            'message': 'Data received via POST!',
            'page_type': 'POST'
        }
        return render(request, 'another_template.html', context)