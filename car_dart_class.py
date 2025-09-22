import random
import string


class Dart:
    def __init__(self, brand, year):
        self.brand = brand
        self.year = year

    def __str__(self):
        return f"Dart(brand='{self.brand}', year={self.year})"


def generate_random_filename(extension=".py"):
    """Generates a random filename with the given extension."""
    random_str = ''.join(random.choices(string.ascii_letters + string.digits, k=8))
    return f"{random_str}{extension}"


# Example usage
if __name__ == "__main__":
    my_car = Dart("Toyota", 2020)
    print(my_car)

    # Generate a random filename
    filename = generate_random_filename()
    print(f"Saving to file: {filename}")

    # Save the class definition to the randomly named file
    with open(filename, 'w') as f:
        f.write("class Dart:\n")
        f.write("    def __init__(self, brand, year):\n")
        f.write("        self.brand = brand\n")
        f.write("        self.year = year\n")
        f.write("\n")
        f.write("    def __str__(self):\n")
        f.write("        return f\"Dart(brand='{self.brand}', year={self.year})\"\n")