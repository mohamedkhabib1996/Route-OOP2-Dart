abstract class Shape {
  String color;

  Shape(this.color);

  // Every subclass must implement its own area calculation.
  double getArea();

  @override
  String toString() {
    return 'Shape: color = $color';
  }
}

class Rectangle extends Shape {
  int length;
  int width;

  Rectangle(this.length, this.width, String color) : super(color);

  @override
  double getArea() {
    return (length * width).toDouble();
  }

  @override
  String toString() {
    return 'Rectangle: length = $length, width = $width, color = $color';
  }
}

class Triangle extends Shape {
  int base;
  int height;

  Triangle(this.base, this.height, String color) : super(color);

  @override
  double getArea() {
    return base * height / 2.0;
  }

  @override
  String toString() {
    return 'Triangle: base = $base, height = $height, color = $color';
  }
}

void main() {
  // Polymorphism: both objects are handled through the Shape superclass.
  List<Shape> shapes = [
    Rectangle(4, 6, 'red'),
    Triangle(4, 5, 'blue'),
  ];

  for (Shape shape in shapes) {
    print(shape);
    print('Area: ${shape.getArea()}');
  }
}
