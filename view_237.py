from django.shortcuts import render

def my_view(request):
    context = {
        'message': 'Hello from the view!'
    }
    return render(request, 'my_template.html', context)
