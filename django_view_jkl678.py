from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse
from django.core.paginator import Paginator

def article_list_view(request):
    """
    A Django view that renders a paginated list of articles
    """
    # Sample data that would typically come from a model
    articles = [
        {'id': 1, 'title': 'Introduction to Django', 'author': 'Alice', 'date': '2023-01-15'},
        {'id': 2, 'title': 'Django Models Explained', 'author': 'Bob', 'date': '2023-02-20'},
        {'id': 3, 'title': 'Working with Django Forms', 'author': 'Charlie', 'date': '2023-03-10'},
        {'id': 4, 'title': 'Django Templates Best Practices', 'author': 'Diana', 'date': '2023-04-05'},
        {'id': 5, 'title': 'Django REST Framework Basics', 'author': 'Eve', 'date': '2023-05-12'},
    ]
    
    paginator = Paginator(articles, 2)  # Show 2 articles per page
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    
    context = {
        'title': 'Articles',
        'page_obj': page_obj,
        'total_articles': len(articles)
    }
    
    return render(request, 'articles/list.html', context)

def article_detail_view(request, article_id):
    """
    A Django view that renders a specific article detail page
    """
    # In a real app, this would fetch from a database
    article = get_object_or_404(
        [
            {'id': 1, 'title': 'Introduction to Django', 'author': 'Alice', 'date': '2023-01-15', 
             'content': 'Django is a high-level Python web framework that encourages rapid development...'},
            {'id': 2, 'title': 'Django Models Explained', 'author': 'Bob', 'date': '2023-02-20',
             'content': 'Django models are Python classes that define the structure of your database...'},
        ],
        id=article_id
    )
    
    context = {
        'title': article['title'],
        'article': article
    }
    
    return render(request, 'articles/detail.html', context)