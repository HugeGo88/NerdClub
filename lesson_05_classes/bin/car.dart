class Car {
  Car(this.amountOfWheels, this.color, this.hp); //Constructor für die Klasse
  void startEngine() {
    _engineIsRunning = true;
  }

  void drive() {
    if (_engineIsRunning) {
      print('Auto von $owner fährt los');
    } else {
      print('Auto von $owner muss Moter anmachen');
    }
  } // Funktionen in Klassen nennt man Methode

  bool _engineIsRunning = false;
  int amountOfWheels; // Variablen in Klassen nennt man Properties (Eigenschaften)
  int hp;
  String color;
  // Das Fragezeich hinter dem Typ bedeutet, dass wir auch Autos haben können ohne Besitzer. Der Variablen Wert ist dann null <-- null bedeutet nicht zugewiesen
  String? owner;

  @override
  String toString() {
    return 'Besitzer: $owner, Räder: $amountOfWheels, Farbe: $color, PS: $hp';
  }
}
