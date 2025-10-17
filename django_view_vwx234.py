from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.shortcuts import redirect

def gallery_view(request):
    """
    A Django view that renders a gallery template
    """
    images = [
        {'id': 1, 'title': 'Mountain Landscape', 'url': '/static/images/mountain.jpg', 'description': 'Beautiful mountain view'},
        {'id': 2, 'title': 'Ocean Sunset', 'url': '/static/images/sunset.jpg', 'description': 'Stunning sunset over the ocean'},
        {'id': 3, 'title': 'City Skyline', 'url': '/static/images/city.jpg', 'description': 'Modern city skyline at night'},
    ]
    
    context = {
        'title': 'Photo Gallery',
        'images': images,
        'total_images': len(images)
    }
    
    return render(request, 'gallery/index.html', context)

@login_required
def upload_view(request):
    """
    A Django view that renders an upload form template
    """
    if request.method == 'POST':
        # Process the uploaded file
        uploaded_file = request.FILES.get('file')
        if uploaded_file:
            # In a real app, you would save the file to storage
            messages.success(request, f'File {uploaded_file.name} uploaded successfully!')
            return redirect('gallery')
        else:
            messages.error(request, 'No file selected for upload.')
    
    context = {
        'title': 'Upload Photo',
        'max_file_size': '5MB',
        'allowed_formats': ['JPG', 'PNG', 'GIF']
    }
    
    return render(request, 'upload/form.html', context)