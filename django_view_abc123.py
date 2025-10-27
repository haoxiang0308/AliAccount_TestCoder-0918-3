from django.shortcuts import render
from django.http import HttpResponse

def sample_view(request):
    """
    A Django view that renders a template
    """
    context = {
        'title': 'Sample Page',
        'content': 'This is a sample page rendered by a Django view.',
        'items': ['Item 1', 'Item 2', 'Item 3']
    }
    
    return render(request, 'sample_template.html', context)

# Alternative view example
def another_view(request):
    """
    Another example of a Django view that renders a template
    """
    context = {
        'message': 'Hello from Django view!',
        'page_title': 'Welcome Page'
    }
    
    return render(request, 'welcome.html', context)