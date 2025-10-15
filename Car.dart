class Car {
  String brand;
  int year;

  Car(this.brand, this.year);

  @override
  String toString() {
    return 'Car{brand: $brand, year: $year}';
  }
}

void main() {
  // Example usage
  Car myCar = Car('Toyota', 2022);
  print(myCar);
}