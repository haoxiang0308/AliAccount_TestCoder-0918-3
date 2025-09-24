class Car {
  String make;
  int year;

  Car(this.make, this.year);

  @override
  String toString() {
    return 'Car{make: $make, year: $year}';
  }
}

void main() {
  // Example usage
  Car myCar = Car('Toyota', 2020);
  print(myCar);
}