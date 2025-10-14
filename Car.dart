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
  var myCar = Car('Tesla', 2022);
  print(myCar);
}