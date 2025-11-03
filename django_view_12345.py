from django.shortcuts import render
from django.http import HttpResponse

def my_template_view(request):
    """
    A Django view that renders a template
    """
    context = {
        'title': 'My Page',
        'message': 'Welcome to my Django application!',
        'items': ['Item 1', 'Item 2', 'Item 3']
    }
    
    # Render the template with context
    return render(request, 'my_template.html', context)

# Alternative view example with a simple response
def simple_view(request):
    return HttpResponse("Hello, Django!")