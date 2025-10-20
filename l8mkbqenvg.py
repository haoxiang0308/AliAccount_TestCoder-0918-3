from django.shortcuts import render
from django.http import HttpResponse


def sample_view(request):
    """
    A sample Django view that renders a template
    """
    context = {
        'title': 'Sample Page',
        'message': 'Welcome to our Django application!',
        'items': ['Item 1', 'Item 2', 'Item 3']
    }
    return render(request, 'sample_template.html', context)


def home_view(request):
    """
    A home page view that renders a template
    """
    context = {
        'welcome_message': 'Welcome to the Home Page',
        'features': [
            'Feature 1: User Authentication',
            'Feature 2: Data Management',
            'Feature 3: Reporting Tools'
        ]
    }
    return render(request, 'home.html', context)


def about_view(request):
    """
    An about page view that renders a template
    """
    context = {
        'page_title': 'About Us',
        'company_info': 'We are a leading company in our field.',
        'team_size': 50
    }
    return render(request, 'about.html', context)