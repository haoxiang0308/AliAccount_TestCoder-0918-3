class Car {
  String mark;
  int year;

  Car(this.mark, this.year);

  @override
  String toString() {
    return 'Car{mark: $mark, year: $year}';
  }
}