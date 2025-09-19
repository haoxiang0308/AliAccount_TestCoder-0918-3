from django.shortcuts import render
from django.http import HttpResponse

def my_template_view(request):
    """
    A Django view that renders a template.
    """
    context = {
        'title': 'My Django Page',
        'message': 'Hello from Django!',
    }
    return render(request, 'my_template.html', context)

def another_view(request):
    """
    Another example view that renders a different template.
    """
    data = {
        'items': ['apple', 'banana', 'orange'],
        'count': 3,
    }
    return render(request, 'another_template.html', data)