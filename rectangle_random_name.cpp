#include "Rectangle.h"

// Constructor
Rectangle::Rectangle(double w, double h) : width(w), height(h) {}

// Getters
double Rectangle::getWidth() const {
    return width;
}

double Rectangle::getHeight() const {
    return height;
}

// Setters
void Rectangle::setWidth(double w) {
    width = w;
}

void Rectangle::setHeight(double h) {
    height = h;
}

// Methods
double Rectangle::area() const {
    return width * height;
}

double Rectangle::perimeter() const {
    return 2 * (width + height);
}