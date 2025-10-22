from django.shortcuts import render
from django.http import HttpResponse

def sample_view(request):
    """
    A sample Django view that renders a template
    """
    context = {
        'title': 'Sample Page',
        'content': 'This is a sample page rendered by a Django view.',
        'items': ['Item 1', 'Item 2', 'Item 3']
    }
    
    return render(request, 'sample_template.html', context)

# Alternative view example with additional functionality
def another_view(request):
    """
    Another example Django view with more complex logic
    """
    import datetime
    
    context = {
        'current_time': datetime.datetime.now(),
        'page_title': 'Dynamic Page',
        'user': request.user if request.user.is_authenticated else 'Guest'
    }
    
    return render(request, 'another_template.html', context)