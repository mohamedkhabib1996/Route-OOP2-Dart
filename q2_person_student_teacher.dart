class Person {
  String name;
  String address;

  Person(this.name, this.address);

  @override
  String toString() {
    return '$name($address)';
  }
}

class Student extends Person {
  int numCourses = 0;
  List<String> courses = [];
  List<int> grades = [];

  Student(String name, String address) : super(name, address);

  void addCourseGrade(String course, int grade) {
    courses.add(course);
    grades.add(grade);
    numCourses = courses.length;
  }

  void printGrades() {
    for (int i = 0; i < numCourses; i++) {
      print('${courses[i]}: ${grades[i]}');
    }
  }

  double getAverageGrades() {
    if (numCourses == 0) {
      return 0.0;
    }

    int total = 0;
    for (int grade in grades) {
      total += grade;
    }

    return total / numCourses;
  }

  @override
  String toString() {
    return 'Student: ${super.toString()}';
  }
}

class Teacher extends Person {
  int numCourses = 0;
  List<String> courses = [];

  Teacher(String name, String address) : super(name, address);

  bool addCourse(String course) {
    if (courses.contains(course)) {
      return false;
    }

    courses.add(course);
    numCourses = courses.length;
    return true;
  }

  bool removeCourse(String course) {
    if (!courses.contains(course)) {
      return false;
    }

    courses.remove(course);
    numCourses = courses.length;
    return true;
  }

  @override
  String toString() {
    return 'Teacher: ${super.toString()}';
  }
}

void main() {
  Student student = Student('Mohamed', 'Cairo');
  print(student);

  student.addCourseGrade('Math', 90);
  student.addCourseGrade('Programming', 80);
  student.addCourseGrade('Physics', 85);
  print('Student courses: ${student.numCourses}');
  student.printGrades();
  print('Average grade: ${student.getAverageGrades()}');

  Teacher teacher = Teacher('Ahmed', 'Giza');
  print(teacher);

  print('Add Math: ${teacher.addCourse('Math')}');
  print('Add Programming: ${teacher.addCourse('Programming')}');
  print('Add Math again: ${teacher.addCourse('Math')}');
  print('Remove Physics: ${teacher.removeCourse('Physics')}');
  print('Remove Math: ${teacher.removeCourse('Math')}');
  print('Teacher courses: ${teacher.numCourses}');
  print('Remaining courses: ${teacher.courses}');
}
