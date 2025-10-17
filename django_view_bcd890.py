from django.shortcuts import render
from django.http import HttpResponse
from django.contrib.sessions.models import Session
from django.views.decorators.csrf import csrf_protect

@csrf_protect
def cart_view(request):
    """
    A Django view that renders shopping cart template
    """
    # Get cart items from session (in a real app, this might come from a database)
    cart_items = request.session.get('cart', [])
    
    # Calculate totals
    total_price = sum(item['price'] * item['quantity'] for item in cart_items)
    total_items = sum(item['quantity'] for item in cart_items)
    
    context = {
        'title': 'Shopping Cart',
        'cart_items': cart_items,
        'total_price': total_price,
        'total_items': total_items
    }
    
    return render(request, 'cart/view.html', context)

def checkout_view(request):
    """
    A Django view that renders checkout form template
    """
    # Get cart items to display in checkout summary
    cart_items = request.session.get('cart', [])
    total_price = sum(item['price'] * item['quantity'] for item in cart_items)
    
    if request.method == 'POST':
        # Process checkout form
        shipping_address = request.POST.get('shipping_address', '')
        payment_method = request.POST.get('payment_method', '')
        
        # In a real app, you would process payment and save order
        context = {
            'title': 'Order Confirmation',
            'order_number': 'ORD-2023-001',
            'shipping_address': shipping_address,
            'payment_method': payment_method,
            'total_price': total_price
        }
        return render(request, 'checkout/confirmation.html', context)
    
    context = {
        'title': 'Checkout',
        'cart_items': cart_items,
        'total_price': total_price,
        'available_payment_methods': ['Credit Card', 'PayPal', 'Bank Transfer']
    }
    
    return render(request, 'checkout/form.html', context)