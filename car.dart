class Car {
  String brand;
  int year;

  Car({required this.brand, required this.year});

  @override
  String toString() {
    return 'Car{brand: $brand, year: $year}';
  }
}

void main() {
  // Example usage
  Car myCar = Car(brand: 'Toyota', year: 2022);
  print(myCar);
}