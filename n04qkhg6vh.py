from django.shortcuts import render
from django.http import HttpResponse

def sample_view(request):
    """
    A Django view that renders a template
    """
    context = {
        'title': 'Sample Page',
        'message': 'Hello from Django view!',
        'items': ['Item 1', 'Item 2', 'Item 3']
    }
    
    return render(request, 'sample_template.html', context)

# Alternative view with additional functionality
def another_view(request):
    """
    Another example Django view
    """
    # You can add more complex logic here
    import datetime
    context = {
        'current_time': datetime.datetime.now(),
        'page_title': 'Dynamic Page'
    }
    
    return render(request, 'another_template.html', context)
