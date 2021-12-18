void main(List<String> arguments) {
  Character robert = Character('Robert', [Item('Axt', 5)], [Item('Trank', 50)]);
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
  // TODO: Wenn Gegner besiegt füge Trank hinzu
  void fight(Character enemy) {
    // if no health not able to fight
    if (defeated) return;
    // if enemy has no health get his items and stop fighting
    if (enemy.defeated) {
      receiveItem(enemy);
      enemy.loseItems();
      return;
    }
    enemy.culculateDamage(this);
    if (!enemy.defeated) {
      culculateDamage(enemy);
    } else {
      receiveItem(enemy);
      enemy.loseItems();
      _elixirs.add(Item('Trank von Gegner', 50));
    }
    // Beide trinken ein Elixir wenn sie können
    enemy.drinkElixir();
    drinkElixir();
  }

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

  Character(this._name, this._waepons, [this._elixirs = const []]);

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
    return '$_name hat $_damage Schaden und $_health Gesundheit, ${_elixirs.length} Heiltränke ($_healing HP)';
  }
}

class Item {
  Item(this._name, this._value);
  String _name;
  int _value;
}
