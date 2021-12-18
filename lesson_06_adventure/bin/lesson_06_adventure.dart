void main(List<String> arguments) {
  Character robert = Character(
      'Robert', [Item('Axt', 15)], [Item('Trank', 50)], Attitude.evil);
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

class Character {
  void fight(Character enemy) {
    int _state = 1;
    while (_state != 0) {
      // wir kämpfen bis _state == 0
      switch (_state) {
        case 1: // check if defeated
          if (defeated) {
            _state = 0;
          } else {
            _state++;
          }
          break;
        case 2: // check if enemy is defeated
          if (enemy.defeated) {
            _state = 0;
          } else {
            _state++;
          }
          break;
        case 3: // damage enemy
          enemy.culculateDamage(this);
          if (enemy.defeated) {
            _state = 31;
          } else {
            _state = 32;
          }
          break;
        case 31: // enemy defeated
          receiveItem(enemy);
          enemy.loseItems();
          _elixirs.add(Item('Trank', 50));
          drinkElixir();
          _state = 0;
          break;
        case 32: // enemy is damaging us
          culculateDamage(enemy);
          if (defeated) {
            _state = 321;
          } else {
            _state = 322;
          }
          break;
        case 321: // enemy defeted us gets items and drinks elixir
          enemy.receiveItem(this);
          loseItems();
          enemy._elixirs.add(Item('Trank', 50));
          enemy.drinkElixir();
          _state = 0;
          break;
        case 322:
          enemy.drinkElixir();
          drinkElixir();
          _state = 0;
          break;
        default:
          print('Unknown state $_state');
          _state = 0;
          enemy._health = 0;
          _health = 0;
      }
    }
  }

  Attitude _attitude;

  void drinkElixir() {
    if (_elixirs.isEmpty || _health > 20) {
      return;
    }
    //_health = _health + _elixirs.last._value; ist das gleiche wie eine Zeilte weiter unten
    _health += _elixirs
        .last._value; // Trank Gesundheit zur eigenen Gesundheit hinzufügen
    _elixirs.removeLast(); // Trank aus Inventar entfernen
    print('********$_name trinkt einen Heiltrank********');
  }

  void receiveItem(Character enemy) {
    _waepons.addAll(enemy._waepons);
  }

  void loseItems() {
    _waepons = [];
  }

  void culculateDamage(Character enemy) {
    _health = _health - enemy._damage;
  }

  Character(this._name, this._waepons,
      [this._elixirs = const [], this._attitude = Attitude.good]);

  final String _name;
  int _health = 100;
  int get _damage {
    int totalDamage = 0;
    for (var item in _waepons) {
      totalDamage = totalDamage + item._value;
    }
    return totalDamage;
  }

  bool get defeated {
    if (_health <= 0) {
      return true;
    } else {
      return false;
    }
  }

  List<Item> _waepons;

  List<Item> _elixirs;
  int get _healing {
    int totalHealing = 0;
    for (var elixir in _elixirs) {
      totalHealing = totalHealing + elixir._value;
    }
    return totalHealing;
  }

  @override
  String toString() {
    switch (_attitude) {
      case Attitude.good:
        return 'Der Held $_name hat $_damage Schaden und $_health Gesundheit, ${_elixirs.length} Heiltränke ($_healing HP)';
      case Attitude.evil:
        return 'Der Bösewicht $_name hat $_damage Schaden und $_health Gesundheit, ${_elixirs.length} Heiltränke ($_healing HP)';
    }
  }
}

enum Attitude { evil, good }

class Item {
  Item(this._name, this._value);
  String _name;
  int _value;
}
