import random
import string

def generate_random_filename(ext):
    """Generates a random filename with a given extension."""
    # Generate a random string of 10 letters/digits
    random_part = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    return f"{random_part}.{ext}"

if __name__ == "__main__":
    # Generate a random .ps1 filename
    random_ps1_filename = generate_random_filename("ps1")
    print(random_ps1_filename)