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
    
    # Render the template with the context
    return render(request, 'sample_template.html', context)

# Alternative view example with more functionality
def another_view(request):
    """
    Another example view with basic request handling.
    """
    if request.method == 'POST':
        # Handle POST request
        return HttpResponse("Received POST request", status=200)
    else:
        # Handle GET request
        context = {
            'page_title': 'Welcome',
            'message': 'This is a Django view rendering a template'
        }
        return render(request, 'another_template.html', context)