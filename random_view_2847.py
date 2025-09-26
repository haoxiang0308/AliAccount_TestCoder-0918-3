from django.shortcuts import render

def my_random_view(request):
    context = {
        'message': 'Hello from the randomly generated view!'
    }
    return render(request, 'my_template.html', context)
