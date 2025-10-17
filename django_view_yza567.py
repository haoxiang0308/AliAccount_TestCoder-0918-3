from django.shortcuts import render
from django.http import HttpResponse
from django.views.decorators.http import require_http_methods
from django.views.decorators.cache import cache_page

@cache_page(60 * 15)  # Cache for 15 minutes
def stats_view(request):
    """
    A Django view that renders statistics template with cached response
    """
    # Simulated statistics data
    stats_data = {
        'total_users': 1250,
        'active_users': 342,
        'new_signups_today': 15,
        'page_views_today': 2847,
        'conversion_rate': 3.2
    }
    
    context = {
        'title': 'Site Statistics',
        'stats': stats_data,
        'last_updated': 'Today, 10:30 AM'
    }
    
    return render(request, 'stats/dashboard.html', context)

@require_http_methods(["GET", "POST"])
def feedback_view(request):
    """
    A Django view that renders a feedback form and handles submissions
    """
    if request.method == 'POST':
        # Process feedback submission
        name = request.POST.get('name', '')
        email = request.POST.get('email', '')
        feedback = request.POST.get('feedback', '')
        
        # In a real app, you would save this to a database
        context = {
            'title': 'Thank You',
            'message': f'Thank you {name} for your feedback! We will contact you at {email} if needed.'
        }
        return render(request, 'feedback/thanks.html', context)
    
    # GET request - show the form
    context = {
        'title': 'Feedback',
        'form_fields': ['name', 'email', 'feedback']
    }
    
    return render(request, 'feedback/form.html', context)