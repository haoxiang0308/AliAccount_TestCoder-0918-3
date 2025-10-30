#ifndef RECTANGLE_H
#define RECTANGLE_H

class Rectangle {
private:
    double width;
    double height;

public:
    // Constructor
    Rectangle(double w, double h);

    // Getters
    double getWidth() const;
    double getHeight() const;

    // Setters
    void setWidth(double w);
    void setHeight(double h);

    // Methods
    double area() const;
    double perimeter() const;
};

#endif // RECTANGLE_H