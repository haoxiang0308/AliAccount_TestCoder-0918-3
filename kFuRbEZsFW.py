from django.shortcuts import render
from django.http import HttpResponse

def my_template_view(request):
    """
    A Django view that renders a template.
    """
    context = {
        'title': 'My Django Page',
        'message': 'Hello from Django!',
        'items': ['item1', 'item2', 'item3']
    }
    return render(request, 'my_template.html', context)

def alternative_view(request):
    """
    An alternative view that renders a different template.
    """
    context = {
        'page_title': 'Alternative Page',
        'content': 'This is an alternative view.'
    }
    return render(request, 'alternative_template.html', context)