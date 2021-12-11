import 'car.dart';

void main(List<String> arguments) {
  Car Auto1 = Car(4, 'red', 500); // Variablen von Klassen = Instance
  Auto1.owner = 'Person1';
  Car Auto2 = Car(5, 'blue', 100);
  // Eine leere Liste vom Type Car
  List<Car> cars = [];
  // mit der Methode add können wir Autos zu dieser Liste hinzufügen
  cars.add(Auto1);
  cars.add(Auto2);
  int amountOfCars = cars.length;
  Auto2.owner = 'Person2';
  Auto1.startEngine();
  Auto2.drive();
  Auto1.drive();
  // Eine Schleife die alle Elemente in einer Liste durchgeht
  for (var car in cars) {
    print(car.owner);
  }
}
