from django.shortcuts import render
from django.http import HttpResponse

def index_view(request):
    """
    A Django view that renders a template with dynamic content
    """
    # Sample data to pass to the template
    context = {
        'page_title': 'Django Template View',
        'welcome_message': 'Welcome to our Django application!',
        'features': [
            'Easy template rendering',
            'Dynamic content generation',
            'Request handling'
        ],
        'user_count': 150
    }
    
    # Render and return the template
    return render(request, 'index.html', context)

def about_view(request):
    """
    Another example view for demonstration
    """
    context = {
        'page_title': 'About Us',
        'about_content': 'This is the about page of our Django application.'
    }
    
    return render(request, 'about.html', context)