from django.shortcuts import render
from django.http import HttpResponse
import random

def product_list_view(request):
    """
    A Django view that renders a product list template
    """
    products = [
        {'name': 'Laptop', 'price': 999.99},
        {'name': 'Phone', 'price': 599.99},
        {'name': 'Tablet', 'price': 399.99},
    ]
    
    context = {
        'products': products,
        'title': 'Product List',
        'total_products': len(products)
    }
    
    return render(request, 'products/list.html', context)

def contact_view(request):
    """
    A Django view for the contact page
    """
    if request.method == 'POST':
        # Process form data
        name = request.POST.get('name')
        email = request.POST.get('email')
        message = request.POST.get('message')
        
        # In a real app, you would save this data or send an email
        context = {
            'success_message': f'Thank you {name}, your message has been received!',
            'title': 'Contact Us'
        }
        return render(request, 'contact_success.html', context)
    else:
        # Render contact form
        context = {
            'title': 'Contact Us',
            'form_action': '/contact/'
        }
        return render(request, 'contact.html', context)