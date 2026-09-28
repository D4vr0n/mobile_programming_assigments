# Comments & Documentation

// 2

void main() {
  int length = 2;
  int width = 3;

  // to find the area of the rectangle.
  int area = length * width;

  /*
   * we calculate the are using this formula:
   * Area = length × width
   * so, 2 × 3 = 6.
   */

  print("Area = $area");
}

// 3

/// class for user data.
class DataValidator {
  /// Checks whether [age] is a correct age.
  ///
  /// [age] must be bigger than or equal to 0.
  ///
  /// Returns `true` if the age is correct.
  ///
  /// Throws Error if [age] is negative.
  static bool isValidAge(int age) {
    if (age < 0) {
      throw ArgumentError('Age cannot be negative');
    }

    return age >= 18;
  }
}

void main() {
  print(DataValidator.isValidAge(20));
}

// 4

/// Calculates the total price with tax.
///
/// - [price] is the original price.
/// - [tax] is the tax percentage.
///
/// Example:
/// ```dart
/// calculateTotal(100, 10);
/// ```
double calculateTotal(double price, double tax) {
  return price + (price * tax / 100);
}

void main() {
  print(calculateTotal(100, 10));
}

// 5

class Person {
  String name;

  Person(this.name);

  /// Old method. Use [sayHello] instead.
  @deprecated
  void greet() {
    print("Hello");
  }

  /// Says hello using the person's name.
  @override
  String toString() {
    return "Person: $name";
  }
}

void main() {
  Person person = Person("Davron");
  print(person);
}

//6

/// A class for storing information about a person.
class Person {
  /// The person's name.
  String name;

  /// The person's age.
  int age;

  /// Creates a new person with [name] and [age].
  Person(this.name, this.age);

  /// Returns a short description of the person.
  String info() {
    return "$name is $age years old.";
  }
}

void main() {
  Person person = Person("Davron", 19);
  print(person.info());
}


# Classes & Constructors

// 2

class Person {
  String name;
  int age;
}
Person(this.name, this.age);

void main() {
  Person person = Person("Davron",20);
}

Person person = Person (Davron, 20);
print (person.name);
print (person.age);

// 3

class Person {
  String name;
  int age;

  Person(this.name, this.age) : assert(age >= 0 && age <= 120);
}

void main() {
  Person person = Person("Davron", 19);
  print(person.age);
}

// 4 

class Singleton {
  static final Singleton _instance = Singleton._();

  Singleton._();

  factory Singleton() {
    return _instance;
  }

  void show() {
    print("Singleton works");
  }
}

void main() {
  var a = Singleton();
  var b = Singleton();

  print(identical(a, b));
}

// 5

class Person {
  int _age = 0;

  int get age => _age;

  set age(int value) {
    if (value >= 0 && value <= 120) {
      _age = value;
    }
  }
}

void main() {
  Person person = Person();
  person.age = 20;
  print(person.age);
}

// 6

class Person {
  final String name;
  final int age;

  const Person(this.name, this.age);
}

void main() {
  const person = Person("Davron", 19);
  print(person.name);
  print(person.age);
}

# Enums

// 2

enum Day {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday
}

void main() {
  for (var day in Day.values) {
    print(day);
  }
}

// 3

enum Day {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday
}

String getDayName(Day day) {
  return switch (day) {
    Day.monday => "Monday",
    Day.tuesday => "Tuesday",
    Day.wednesday => "Wednesday",
    Day.thursday => "Thursday",
    Day.friday => "Friday",
    Day.saturday => "Saturday",
    Day.sunday => "Sunday",
  };
}

void main() {
  print(getDayName(Day.monday));
}

// 4

abstract class Shape {
  double get area;
}

enum Figure implements Shape {
  square(5),
  circle(3);

  final double size;

  const Figure(this.size);

  @override
  double get area => this == Figure.square
      ? size * size
      : 3.14 * size * size;
}

void main() {
  print(Figure.square.area);
  print(Figure.circle.area);
}

// 5

enum Day {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday
}

void main() {
  String value = "monday";

  try {
    Day day = Day.values.byName(value);
    print(day);
  } catch (e) {
    print("Invalid day");
  }
}

// 6

enum Status<T> {
  success<String>("Success"),
  error<String>("Error");

  final T message;

  const Status(this.message);

  static Status<String> fromName(String name) {
    return Status.values.byName(name);
  }
}

void main() {
  print(Status.success.message);
  print(Status.fromName("error"));
}

# Inheritance

// 2

class Animal {
  void makeSound() {
    print("Animal sound");
  }
}

class Dog extends Animal {
  @override
  void makeSound() {
    print("Woof");
  }
}

void main() {
  Dog dog = Dog();
  dog.makeSound();
}

// 3

class Car {
  String brand;

  Car(this.brand);
}

class ElectricCar extends Car {
  ElectricCar(super.brand);
}

void main() {
  var car = ElectricCar("Tesla");
  print(car.brand);
}

//4

class Shape {
  void show() {
    print("Shape");
  }
}

class Polygon extends Shape {
  void sides() {
    print("Polygon");
  }
}

class Triangle extends Polygon {
  void type() {
    print("Triangle");
  }
}

void main() {
  Triangle triangle = Triangle();
  triangle.show();
  triangle.sides();
  triangle.type();
}

// 5

abstract class Animal {
  void eat() {
    print("Eating");
  }

  void makeSound();
}

class Dog extends Animal {
  @override
  void makeSound() {
    print("Woof");
  }
}

void main() {
  Dog dog = Dog();
  dog.eat();
  dog.makeSound();
}

// 6

final class Animal {
  void makeSound() {
    print("Animal sound");
  }
}

base class Dog extends Animal {
  @override
  void makeSound() {
    print("Woof");
  }
}

void main() {
  Dog dog = Dog();
  dog.makeSound();
}

# Mixins & Interfaces

// 2

interface class DBConnector {
  void connect();
}

class MySQLConnector implements DBConnector {
  @override
  void connect() {
    print("Connected to MySQL");
  }
}

void main() {
  MySQLConnector db = MySQLConnector();
  db.connect();
}

// 3

mixin Flyable {
  void fly() {
    print("Flying");
  }
}

class Bird with Flyable {}

void main() {
  Bird bird = Bird();
  bird.fly();
}

// 4

mixin Walker {
  void walk() {
    print("Walking");
  }
}

mixin Swimmer {
  void swim() {
    print("Swimming");
  }
}

mixin Flyable {
  void fly() {
    print("Flying");
  }
}

class Duck with Walker, Swimmer, Flyable {}

void main() {
  Duck duck = Duck();
  duck.walk();
  duck.swim();
  duck.fly();
}

// 5

class Animal {
  String name;

  Animal(this.name);
}

mixin Barker on Animal {
  void bark() {
    print('$name says woof!');
  }
}

class Dog extends Animal with Barker {
  Dog(String name) : super(name);
}

void main() {
  Dog dog = Dog('Rex');
  dog.bark();
}

// 6

abstract class Speaker {
  void speak();
}

class Person implements Speaker {
  @override
  void speak() {
    print('Hello, I am a person.');
  }
}

mixin Walker {
  void walk() {
    print('Walking...');
  }
}

class Dog with Walker {}

void main() {
  Person person = Person();
  person.speak();

  Dog dog = Dog();
  dog.walk();
}



# Polymorphism






// 2
abstract class Shape {
  double area();
}

class Circle extends Shape {
  double radius;

  Circle(this.radius);

  @override
  double area() {
    return 3.14159 * radius * radius;
  }
}

class Rectangle extends Shape {
  double width;
  double height;

  Rectangle(this.width, this.height);

  @override
  double area() {
    return width * height;
  }
}

void problem2() {
  List<Shape> shapes = [Circle(5), Rectangle(4, 6), Circle(2)];

  for (Shape shape in shapes) {
    print('Area: ${shape.area()}');
  }
}

 List<Shape> shapes = [Circle(5), Rectangle(4, 6)];
  for (Shape s in shapes) {
    print(s.area());
  }

// 3
void problem3() {
  List<Shape> shapes = [Circle(3), Rectangle(2, 5)];

  for (Shape shape in shapes) {
    if (shape is Circle) {
      print('This is a Circle with radius ${shape.radius}');
    } else if (shape is Rectangle) {
      print('This is a Rectangle ${shape.width} x ${shape.height}');
    }
  }

  Shape s = Circle(10);
  Circle c = s as Circle;
  print('Casted radius: ${c.radius}');
}

 checkType(Circle(3));


// 4
class Repository<T> {
  final List<T> _items = [];

  void add(T item) {
    _items.add(item);
  }

  T get(int index) {
    return _items[index];
  }

  List<T> getAll() {
    return _items;
  }
}

void problem4() {
  Repository<String> names = Repository<String>();
  names.add('Ali');
  names.add('Davron');
  print(names.getAll());

  Repository<int> numbers = Repository<int>();
  numbers.add(10);
  numbers.add(20);
  print(numbers.get(1));
}

Repository<String> repo = Repository<String>();
  repo.add('Ali');
  repo.add('Davron');
  print(repo.getAll());


// 5
sealed class Vehicle {}

class Car extends Vehicle {
  int doors;

  Car(this.doors);
}

class Bike extends Vehicle {
  bool hasBell;

  Bike(this.hasBell);
}

class Truck extends Vehicle {
  double load;

  Truck(this.load);
}

String describe(Vehicle v) {
  return switch (v) {
    Car c => 'Car with ${c.doors} doors',
    Bike b => 'Bike, bell: ${b.hasBell}',
    Truck t => 'Truck carrying ${t.load} tons',
  };
}

void problem5() {
  print(describe(Car(4)));
  print(describe(Bike(true)));
  print(describe(Truck(12.5)));
}

print(describe(Car()));
  print(describe(Bike()));

// 6
abstract class DiscountStrategy {
  double apply(double price);
}

class NoDiscount implements DiscountStrategy {
  @override
  double apply(double price) {
    return price;
  }
}

class TenPercentDiscount implements DiscountStrategy {
  @override
  double apply(double price) {
    return price * 0.9;
  }
}

class HalfPriceDiscount implements DiscountStrategy {
  @override
  double apply(double price) {
    return price * 0.5;
  }
}

class Cart {
  DiscountStrategy strategy;

  Cart(this.strategy);

  double checkout(double price) {
    return strategy.apply(price);
  }
}

void problem6() {
  Cart cart = Cart(NoDiscount());
  print('No discount: ${cart.checkout(100)}');

  cart.strategy = TenPercentDiscount();
  print('10% off: ${cart.checkout(100)}');

  cart.strategy = HalfPriceDiscount();
  print('Half price: ${cart.checkout(100)}');
}

void main() {
  print('--- 2 ---');
  problem2();

  print('--- 3 ---');
  problem3();

  print('--- 4 ---');
  problem4();

  print('--- 5 ---');
  problem5();

  print('--- 6 ---');
  problem6();
}

 Cart cart = Cart(NoDiscount());
  print(cart.total(100));
  cart.discount = HalfPrice();
  print(cart.total(100));



# Async Operations









import 'dart:async';

// 2
Future<String> getUser() async {
  await Future.delayed(Duration(seconds: 2));
  return 'User: Davron, age 20';
}

// 3
Future<int> task(int n) async {
  await Future.delayed(Duration(seconds: n));
  return n * 10;
}

// 4
Future<void> timerTicks() async {
  int count = 0;
  Completer<void> done = Completer<void>();
  late StreamSubscription<int> sub;

  sub = Stream.periodic(Duration(seconds: 1), (i) => i).listen((value) {
    count++;
    print('Tick $value');
    if (count == 5) {
      sub.cancel();
      done.complete();
    }
  });

  await done.future;
  print('Subscription cancelled');
}

// 5
Future<void> transformStream() async {
  Stream<int> numbers = Stream.fromIterable([1, 2, 2, 3, 4, 4, 5, 6]);

  await for (int n in numbers.map((n) => n * 2).where((n) => n > 4).distinct()) {
    print(n);
  }
}

// 6
Future<void> handleErrors() async {
  Stream<int> numbers = Stream.fromIterable([1, 2, 3, 4]).map((n) {
    if (n == 3) throw Exception('Bad number: $n');
    return n;
  });

  await for (int n in numbers.handleError((e) => print('Error caught: $e'))) {
    print(n);
  }
}

import 'dart:async';

// 2
Future<String> getUser() async {
  await Future.delayed(Duration(seconds: 2));
  return 'User: Davron, age 20';
}

Future<void> main() async {
  print(await getUser());
}

// 3
Future<int> task(int n) async {
  await Future.delayed(Duration(seconds: n));
  return n * 10;
}

Future<void> main() async {
  List<int> results = await Future.wait([task(1), task(2), task(3)]);
  print(results);
  print('Total: ${results.reduce((a, b) => a + b)}');
}

// 4
Future<void> timerTicks() async {
  int count = 0;
  Completer<void> done = Completer<void>();
  late StreamSubscription<int> sub;

  sub = Stream.periodic(Duration(seconds: 1), (i) => i).listen((value) {
    count++;
    print('Tick $value');
    if (count == 5) {
      sub.cancel();
      done.complete();
    }
  });

  await done.future;
  print('Subscription cancelled');
}

Future<void> main() async {
  await timerTicks();
}

// 5
Future<void> transformStream() async {
  Stream<int> numbers = Stream.fromIterable([1, 2, 2, 3, 4, 4, 5, 6]);

  await for (int n in numbers.map((n) => n * 2).where((n) => n > 4).distinct()) {
    print(n);
  }
}

Future<void> main() async {
  await transformStream();
}

// 6
Future<void> handleErrors() async {
  Stream<int> numbers = Stream.fromIterable([1, 2, 3, 4]).map((n) {
    if (n == 3) throw Exception('Bad number: $n');
    return n;
  });

  await for (int n in numbers.handleError((e) => print('Error caught: $e'))) {
    print(n);
  }
}

Future<void> main() async {
  await handleErrors();
}



# Exceptions & Error Handling



// 2
int divide(int a, int b) {
  try {
    return a ~/ b;
  } on UnsupportedError {
    print('Cannot divide by zero');
    return 0;
  }
}

void main() {
  print(divide(10, 2));
  print(divide(10, 0));
}

// 3
void greet(String? name) {
  if (name == null || name.isEmpty) {
    throw ArgumentError('Name cannot be empty or null');
  }
  print('Hello, $name');
}

void main() {
  try {
    greet('Davron');
    greet('');
  } catch (e) {
    print('Error: $e');
  }
}

// 4
void main() {
  try {
    int number = int.parse('abc');
    print(number);
  } on FormatException {
    print('That is not a valid number');
  } on UnsupportedError {
    print('Unsupported operation');
  } catch (e) {
    print('Something went wrong: $e');
  }
}

// 5
void main() {
  try {
    int result = 10 ~/ 0;
    print(result);
  } catch (e, stackTrace) {
    print('Error: $e');
    print('Stack trace:');
    print(stackTrace);
  }
}

// 6
void checkAge(int age) {
  try {
    if (age < 0) {
      throw ArgumentError('Age cannot be negative');
    }
    print('Age is $age');
  } catch (e) {
    print('Error found in checkAge: $e');
    rethrow;
  }
}

void main() {
  try {
    checkAge(20);
    checkAge(-5);
  } catch (e) {
    print('Caught again in main: $e');
  }
}












