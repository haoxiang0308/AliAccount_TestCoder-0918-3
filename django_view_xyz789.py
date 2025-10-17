from django.shortcuts import render
from django.http import HttpResponse
from django.template import loader

def home_view(request):
    """
    A Django view that renders a template with context
    """
    # Sample context data
    context = {
        'title': 'Home Page',
        'welcome_message': 'Welcome to our Django application!',
        'features': [
            'Fast rendering',
            'Template support',
            'Easy to use'
        ]
    }
    
    # Render the template with context
    return render(request, 'home.html', context)

def about_view(request):
    """
    Another example view rendering a different template
    """
    template = loader.get_template('about.html')
    context = {
        'company_name': 'My Company',
        'founded_year': 2023,
        'team_size': 10
    }
    
    return HttpResponse(template.render(context, request))