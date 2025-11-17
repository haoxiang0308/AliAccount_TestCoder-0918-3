from django.shortcuts import render
from django.http import HttpResponse

def sample_view(request):
    """
    A Django view that renders a template.
    """
    context = {
        'title': 'Sample Page',
        'content': 'This is a sample page rendered by a Django view.',
        'items': ['Item 1', 'Item 2', 'Item 3']
    }
    
    # Render the template with the context
    return render(request, 'sample_template.html', context)

# Alternative view with more functionality
def dynamic_view(request):
    """
    A more dynamic Django view with template rendering.
    """
    import datetime
    
    context = {
        'current_time': datetime.datetime.now(),
        'page_title': 'Dynamic Page',
        'user': request.user if request.user.is_authenticated else 'Guest',
        'features': [
            {'name': 'Feature 1', 'description': 'This is the first feature'},
            {'name': 'Feature 2', 'description': 'This is the second feature'},
        ]
    }
    
    return render(request, 'dynamic_template.html', context)