from django.shortcuts import render
from django.http import HttpResponse

def sample_view(request):
    """
    A sample Django view that renders a template.
    """
    context = {
        'title': 'Sample Page',
        'message': 'Welcome to our Django application!',
        'items': ['Item 1', 'Item 2', 'Item 3']
    }
    
    # Render the template with context
    return render(request, 'sample_template.html', context)

# Alternative view example with a different template
def another_view(request):
    """
    Another example view with different context data.
    """
    context = {
        'page_title': 'Another Page',
        'content': 'This is the content for another page.'
    }
    
    return render(request, 'another_template.html', context)