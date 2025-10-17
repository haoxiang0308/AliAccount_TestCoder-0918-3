from django.shortcuts import render
from django.http import HttpResponse
from django.contrib.auth.decorators import login_required

def dashboard_view(request):
    """
    A Django view that renders a dashboard template for authenticated users
    """
    if request.user.is_authenticated:
        context = {
            'title': 'Dashboard',
            'username': request.user.username,
            'last_login': request.user.last_login,
            'dashboard_stats': {
                'posts': 15,
                'comments': 42,
                'followers': 28
            }
        }
    else:
        context = {
            'title': 'Public Dashboard',
            'message': 'Please log in to see personalized content'
        }
    
    return render(request, 'dashboard.html', context)

@login_required
def settings_view(request):
    """
    A Django view that renders user settings template (requires authentication)
    """
    context = {
        'title': 'Account Settings',
        'user_email': request.user.email,
        'preferences': {
            'notifications': True,
            'privacy': 'public',
            'theme': 'light'
        }
    }
    
    return render(request, 'settings.html', context)