from django.shortcuts import render
from django.http import HttpResponse

def sample_view(request):
    """
    A sample Django view that renders a template
    """
    context = {
        'title': 'Sample Page',
        'message': 'Welcome to the sample page!',
        'items': ['Item 1', 'Item 2', 'Item 3']
    }
    
    return render(request, 'sample_template.html', context)

# Alternative view example with additional functionality
def another_view(request):
    """
    Another example Django view with conditional logic
    """
    import datetime
    
    context = {
        'current_time': datetime.datetime.now(),
        'page_title': 'Current Time Page'
    }
    
    return render(request, 'time_template.html', context)