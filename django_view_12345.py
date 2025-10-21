from django.shortcuts import render
from django.http import HttpResponse

def sample_view(request):
    """
    A Django view that renders a template
    """
    context = {
        'title': 'Sample Page',
        'message': 'Hello from Django view!',
        'items': ['Item 1', 'Item 2', 'Item 3']
    }
    
    # Render the template with context
    return render(request, 'sample_template.html', context)

# Alternative view with conditional logic
def conditional_view(request):
    """
    A Django view with conditional template rendering
    """
    import random
    
    # Randomly select a template
    templates = ['home.html', 'about.html', 'contact.html']
    selected_template = random.choice(templates)
    
    context = {
        'template_name': selected_template,
        'random_number': random.randint(1, 100)
    }
    
    return render(request, selected_template, context)