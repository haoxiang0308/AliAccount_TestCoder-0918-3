from django.shortcuts import render
from django.http import HttpResponse
from datetime import datetime

def blog_list_view(request):
    """
    A Django view that renders a blog post list template
    """
    blog_posts = [
        {
            'title': 'Getting Started with Django',
            'author': 'John Doe',
            'date': datetime(2023, 6, 15),
            'excerpt': 'Learn the basics of Django framework...'
        },
        {
            'title': 'Advanced Django Techniques',
            'author': 'Jane Smith',
            'date': datetime(2023, 7, 22),
            'excerpt': 'Deep dive into advanced Django features...'
        },
        {
            'title': 'Django Security Best Practices',
            'author': 'Bob Johnson',
            'date': datetime(2023, 8, 5),
            'excerpt': 'Keep your Django applications secure...'
        }
    ]
    
    context = {
        'posts': blog_posts,
        'title': 'Blog Posts',
        'post_count': len(blog_posts)
    }
    
    return render(request, 'blog/list.html', context)

def user_profile_view(request, user_id):
    """
    A Django view that renders a user profile template
    """
    # In a real application, this data would come from the database
    user_data = {
        'id': user_id,
        'username': f'user_{user_id}',
        'email': f'user{user_id}@example.com',
        'join_date': datetime(2023, 1, 1),
        'posts_count': 25
    }
    
    context = {
        'user': user_data,
        'title': f'Profile - {user_data["username"]}'
    }
    
    return render(request, 'user/profile.html', context)