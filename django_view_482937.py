from django.shortcuts import render
from django.http import HttpResponse


def sample_template_view(request):
    """
    A Django view that renders a template with context data.
    """
    context = {
        'title': 'Sample Page',
        'message': 'Welcome to our Django application!',
        'items': ['Item 1', 'Item 2', 'Item 3']
    }
    
    return render(request, 'sample_template.html', context)


def simple_view(request):
    """
    A simple Django view that renders a basic template.
    """
    return render(request, 'simple.html', {})