import random
import string
import os

def generate_random_filename():
    """Generate a random filename with .py extension"""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def create_django_view_file():
    """Create a Django view in a randomly named file"""
    # Generate random filename
    random_filename = generate_random_filename()
    filepath = f"/workspace/{random_filename}"
    
    # Django view code
    django_view_code = '''from django.shortcuts import render
from django.http import HttpResponse

def sample_view(request):
    """
    A Django view that renders a template
    """
    context = {
        \'title\': \'Sample Page\',
        \'message\': \'Hello from Django view!\',
        \'items\': [\'Item 1\', \'Item 2\', \'Item 3\']
    }
    
    return render(request, \'sample_template.html\', context)

# Alternative view with additional functionality
def another_view(request):
    """
    Another example Django view
    """
    # You can add more complex logic here
    import datetime
    context = {
        \'current_time\': datetime.datetime.now(),
        \'page_title\': \'Dynamic Page\'
    }
    
    return render(request, \'another_template.html\', context)
'''
    
    # Write the code to the randomly named file
    with open(filepath, 'w') as f:
        f.write(django_view_code)
    
    print(f"Django view saved to: {filepath}")
    return filepath

if __name__ == "__main__":
    created_file = create_django_view_file()