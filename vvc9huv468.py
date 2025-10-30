from django.shortcuts import render
from django.http import HttpResponse

def my_template_view(request):
    """
    A Django view that renders a template
    """
    context = {
        'title': 'My Page',
        'content': 'Welcome to my Django application!',
        'items': ['Item 1', 'Item 2', 'Item 3']
    }
    
    return render(request, 'my_template.html', context)

# Alternative view example with more functionality
def advanced_template_view(request):
    """
    A more advanced Django view with additional logic
    """
    # Example of processing data before rendering
    user_data = {
        'username': request.user.username if request.user.is_authenticated else 'Guest',
        'page_title': 'Advanced Template Page'
    }
    
    return render(request, 'advanced_template.html', {'user_data': user_data})