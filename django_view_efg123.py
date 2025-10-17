from django.shortcuts import render
from django.http import HttpResponse
from django.contrib.auth import authenticate, login
from django.contrib.auth.forms import AuthenticationForm

def login_view(request):
    """
    A Django view that renders a login form template
    """
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            next_page = request.GET.get('next', '/')
            return HttpResponse(f'<script>window.location.href = "{next_page}"</script>')
        else:
            context = {
                'title': 'Login',
                'error': 'Invalid username or password',
                'form': AuthenticationForm()
            }
    else:
        context = {
            'title': 'Login',
            'form': AuthenticationForm()
        }
    
    return render(request, 'auth/login.html', context)

def profile_view(request):
    """
    A Django view that renders user profile template
    """
    if request.user.is_authenticated:
        context = {
            'title': 'User Profile',
            'user': {
                'username': request.user.username,
                'email': request.user.email,
                'first_name': request.user.first_name,
                'last_name': request.user.last_name,
                'date_joined': request.user.date_joined,
                'is_premium': True  # Example premium status
            }
        }
    else:
        context = {
            'title': 'Profile',
            'error': 'You must be logged in to view your profile'
        }
    
    return render(request, 'auth/profile.html', context)