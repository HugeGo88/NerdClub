void main(List<String> arguments) {
  Character robert = Character('Robert', [Item('Axt', 15)]);
  Character olaf = Character('Olaf', [Item('Schwert', 20), Item('Bogen', 10)]);
  //TODO: Kämpfe bis robert Olaf besiegt hat (While-Schleife)
  robert.fight(olaf);

  //TODO: Nach dem Kampf schau nach ob deine Gesundheit unter 20 ist und nimm einen Trank
  print(robert);
  print(olaf);
}

class Character {
  // TODO: Wenn Gegner besiegt füge Trank hinzu
  void fight(Character enemy) {
    // if no health not able to fight
    if (_health <= 0) return;
    // if enemy has no health get his items and stop fighting
    if (enemy._health <= 0) {
      receiveItem(enemy);
      enemy.loseItems();
      return;
    }
    enemy.culculateDamage(this);
    if (enemy._health > 0) {
      culculateDamage(enemy);
    } else {
      receiveItem(enemy);
      enemy.loseItems();
    }
  }

  //TODO: Füge Methode hinzu zum Heiltrank nehmen.

  void receiveItem(Character enemy) {
    _waepons.addAll(enemy._waepons);
  }

  void loseItems() {
    _waepons = [];
  }

  void culculateDamage(Character enemy) {
    _health = _health - enemy._damage;
  }

  Character(this._name, this._waepons);

  final String _name;
  int _health = 100;
  int get _damage {
    int totalDamage = 0;
    for (var item in _waepons) {
      totalDamage = totalDamage + item._value;
    }
    return totalDamage;
  }

  List<Item> _waepons;

  final List<Item> _elixirs = [];
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
