from django.shortcuts import render
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
import json

def search_results_view(request):
    """
    A Django view that renders search results template
    """
    query = request.GET.get('q', '')
    
    # Sample search results (in a real app, this would come from a database)
    if query:
        results = [
            {'id': 1, 'title': f'Result for {query} 1', 'description': 'This is a sample search result'},
            {'id': 2, 'title': f'Result for {query} 2', 'description': 'Another search result'},
            {'id': 3, 'title': f'Result for {query} 3', 'description': 'Yet another search result'},
        ]
    else:
        results = []
    
    context = {
        'title': f'Search Results for "{query}"' if query else 'Search',
        'query': query,
        'results': results,
        'result_count': len(results)
    }
    
    return render(request, 'search/results.html', context)

@csrf_exempt
def api_data_view(request):
    """
    A Django view that renders JSON data as a template (or returns JSON directly)
    """
    if request.method == 'POST':
        try:
            data = json.loads(request.body)
            message = f"Received data: {data}"
        except json.JSONDecodeError:
            message = "Invalid JSON received"
        
        context = {
            'title': 'API Response',
            'message': message,
            'status': 'success'
        }
        return render(request, 'api/response.html', context)
    else:
        # GET request
        sample_data = {
            'api_version': '1.0',
            'endpoints': ['/api/data/', '/api/users/', '/api/posts/'],
            'description': 'Sample API data'
        }
        
        context = {
            'title': 'API Data',
            'data': sample_data
        }
        
        return render(request, 'api/data.html', context)