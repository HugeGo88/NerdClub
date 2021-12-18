import 'character.dart';
import 'item.dart';

void main(List<String> arguments) {
  Character robert = Character('Robert', [Item('Axt', 15)], [Item('Trank', 50)], Attitude.evil);
  Character olaf = Character('Olaf', [Item('Schwert', 7), Item('Bogen', 10)]);
  int i = 1;
  while (!olaf.defeated && !robert.defeated) {
    robert.fight(olaf);
    print('Runde: $i');
    print(robert);
    print(olaf);
    print('****************');
    i++;
  }
  print(robert);
  print(olaf);
}
