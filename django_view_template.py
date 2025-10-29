from django.shortcuts import render
from django.http import HttpResponse

def sample_view(request):
    """
    A Django view that renders a template
    """
    # Sample context data to pass to the template
    context = {
        'title': 'Sample Page',
        'message': 'Welcome to our Django application!',
        'items': ['Item 1', 'Item 2', 'Item 3']
    }
    
    # Render the template with context
    return render(request, 'sample_template.html', context)

# Alternative view with more complex logic
def another_view(request):
    """
    Another example Django view
    """
    if request.method == 'POST':
        # Handle POST request
        pass
    else:
        # Handle GET request
        context = {
            'page_title': 'Home Page',
            'content': 'This is a sample Django view rendering a template.'
        }
        return render(request, 'home.html', context)