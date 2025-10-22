import random
import string
import os
from datetime import datetime

def generate_random_filename(extension='txt'):
    """Generate a random filename with the given extension"""
    random_string = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    return random_string + '.' + extension

def save_form_data(name, email, message):
    """Save form data to a file"""
    data = f"Name: {name}\n"
    data += f"Email: {email}\n"
    data += f"Message: {message}\n"
    data += f"Submitted at: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n"
    data += "------------------------\n"
    
    with open('form_submissions.txt', 'a') as f:
        f.write(data)

def validate_form_data(name, email, message):
    """Validate form data and return list of errors"""
    errors = []
    if not name:
        errors.append("Name is required")
    if not email:
        errors.append("Email is required")
    elif "@" not in email or "." not in email:
        errors.append("Invalid email format")
    if not message:
        errors.append("Message is required")
    return errors

def create_form_page():
    """Create a simple HTML form page"""
    html_content = '''
    <html>
    <head>
        <title>Form Processing Example</title>
    </head>
    <body>
        <h2>Contact Form</h2>
        <form method="post" action="">
            <p>
                <label for="name">Name:</label><br>
                <input type="text" id="name" name="name" required>
            </p>
            <p>
                <label for="email">Email:</label><br>
                <input type="email" id="email" name="email" required>
            </p>
            <p>
                <label for="message">Message:</label><br>
                <textarea id="message" name="message" rows="5" cols="40" required></textarea>
            </p>
            <p>
                <input type="submit" value="Submit">
            </p>
        </form>
    </body>
    </html>
    '''
    return html_content

def main():
    print("Content-Type: text/html\n")
    
    # Simulate form processing
    # In a real web environment, we would check for POST method and form data
    # For demonstration, we'll just generate a random filename and save this script
    
    random_filename = generate_random_filename('py')
    
    # Copy the current script to the random filename
    with open(__file__, 'r') as source_file:
        script_content = source_file.read()
    
    # Make sure we don't overwrite an existing file
    counter = 0
    original_random_filename = random_filename
    while os.path.exists(random_filename):
        name, ext = os.path.splitext(original_random_filename)
        counter += 1
        random_filename = f"{name}_{counter}{ext}"
    
    with open(random_filename, 'w') as target_file:
        target_file.write(script_content)
    
    print(f"<h2>Form Processing Script Created!</h2>")
    print(f"<p>Script saved with random filename: {random_filename}</p>")
    print(create_form_page())

if __name__ == "__main__":
    main()