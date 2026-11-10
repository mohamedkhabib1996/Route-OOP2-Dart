import 'dart:math';

class GeometricObject {
  String color;
  bool filled;

  GeometricObject()
      : color = 'white',
        filled = false;

  GeometricObject.withValues(this.color, this.filled);

  @override
  String toString() {
    return 'GeometricObject: color = $color, filled = $filled';
  }
}

class Triangle extends GeometricObject {
  double side1;
  double side2;
  double side3;

  Triangle()
      : side1 = 1.0,
        side2 = 1.0,
        side3 = 1.0,
        super();

  Triangle.withSides(this.side1, this.side2, this.side3) : super();

  double getPerimeter() {
    return side1 + side2 + side3;
  }

  double getArea() {
    double semiPerimeter = getPerimeter() / 2;
    return sqrt(semiPerimeter *
        (semiPerimeter - side1) *
        (semiPerimeter - side2) *
        (semiPerimeter - side3));
  }

  @override
  String toString() {
    return 'Triangle: side1 = $side1, side2 = $side2, side3 = $side3';
  }
}

class Rectangle extends GeometricObject {
  double height;
  double width;

  Rectangle()
      : height = 1.0,
        width = 1.0,
        super();

  Rectangle.withValues(this.width, this.height, String color, bool filled)
      : super.withValues(color, filled);

  double getArea() {
    return width * height;
  }

  double getPerimeter() {
    return 2 * (width + height);
  }

  @override
  String toString() {
    return 'Rectangle: height = $height, width = $width';
  }
}

void main() {
  GeometricObject defaultObject = GeometricObject();
  GeometricObject coloredObject = GeometricObject.withValues('blue', true);
  print(defaultObject);
  print(coloredObject);

  Triangle defaultTriangle = Triangle();
  Triangle triangle = Triangle.withSides(3.0, 4.0, 5.0);
  print(defaultTriangle);
  print(triangle);
  print('Triangle area: ${triangle.getArea()}');
  print('Triangle perimeter: ${triangle.getPerimeter()}');

  Rectangle defaultRectangle = Rectangle();
  Rectangle rectangle = Rectangle.withValues(4.0, 6.0, 'red', true);
  print(defaultRectangle);
  print(rectangle);
  print('Rectangle color: ${rectangle.color}');
  print('Rectangle filled: ${rectangle.filled}');
  print('Rectangle area: ${rectangle.getArea()}');
  print('Rectangle perimeter: ${rectangle.getPerimeter()}');
}
