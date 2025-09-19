from django.shortcuts import render
from django.http import HttpResponse

def my_template_view(request):
    """
    A simple Django view that renders a template
    """
    context = {
        'title': 'My Django App',
        'message': 'Hello from Django!',
        'items': ['apple', 'banana', 'orange']
    }
    return render(request, 'my_template.html', context)

def another_view(request):
    """
    Another example view that renders a different template
    """
    return render(request, 'another_template.html', {
        'user': 'John Doe',
        'authenticated': True
    })