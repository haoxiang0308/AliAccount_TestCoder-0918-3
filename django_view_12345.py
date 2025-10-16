from django.shortcuts import render
from django.http import HttpResponse

def sample_template_view(request):
    """
    A Django view that renders a template
    """
    context = {
        'title': 'Sample Page',
        'content': 'This is a sample page rendered by a Django view.',
        'items': ['Item 1', 'Item 2', 'Item 3']
    }
    return render(request, 'sample_template.html', context)

def another_view(request):
    """
    Another example view that renders a different template
    """
    context = {
        'message': 'Hello from Django view!',
        'data': {'name': 'John', 'age': 30}
    }
    return render(request, 'another_template.html', context)