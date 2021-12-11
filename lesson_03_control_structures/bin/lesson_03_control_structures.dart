//Hier wird eine Bibliothek hinzugefügt
// Eine Bibliothek ist Code den schon jemand geschrieben hat den wir dann verwenden können
import 'dart:io';

void main(List<String> arguments) {
  /* KONTROLL STRUKTUREN */
  // Schleife (wird immer wieder durchlaufen solange der mittlere Ausdruck war ist, in unserem Beispiel i <= 20 solange i kleiner gleich 20 ist)
  // der ++ Operator wird zum hochzählen verwendet. ++ bedeuted dabei immer um eins hochzählen.
  for (var i = 0; i <= 20; i++) {
    print('Hugo ist $i');
  }

  print('Bitte gib deinen Namen ein');
  var input = stdin
      .readLineSync(); // Nutzereingabe (hier kann ich die Eingabe von Nutzern abfragen)
  print('Hello $input');

  // IF und ELSE --> WENN abfrage
  // Wenn der Wert in der Klammer wahr ist, dann führe alles in der Geschweiftenklammer aus ansonsten den Teil im ELSE Bereich
  if (input as String == 'Hugo') {
    print('$input ist alt!');
  } else {
    print('$input ist cool!');
  }
}
