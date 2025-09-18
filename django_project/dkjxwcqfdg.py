from django.shortcuts import render

def my_template_view(request):
    """
    A Django view that renders a template.
    """
    context = {
        'message': 'Hello from Django!',
        'items': ['item1', 'item2', 'item3']
    }
    return render(request, 'my_template.html', context)