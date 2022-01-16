import 'car.dart';

void main(List<String> arguments) {
  Car auto1 = Car(4, 'red', 500); // Variablen von Klassen = Instance
  auto1.owner = 'Person1';
  Car auto2 = Car(5, 'blue', 100);
  // Eine leere Liste vom Type Car
  List<Car> cars = [];
  // mit der Methode add können wir Autos zu dieser Liste hinzufügen
  cars.add(auto1);
  cars.add(auto2);
  // ignore: unused_local_variable
  int amountOfCars = cars.length;
  auto2.owner = 'Person2';
  auto1.startEngine();
  auto2.drive();
  auto1.drive();
  // Eine Schleife die alle Elemente in einer Liste durchgeht
  for (var car in cars) {
    print(car.owner);
  }
}
