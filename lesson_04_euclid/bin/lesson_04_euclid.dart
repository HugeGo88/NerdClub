// Rückgabewert Funktionsname (Parameter)
int euclidOld(int a, int b) {
  int i = 0;
  if (a == 0) {
    return b;
  } else {
    while (b != 0) {
      if (a > b) {
        a = a - b;
      } else {
        b = b - a;
      }
      i++;
    }
    print('Die Schleife wurde $i mal durchlaufen');
    return a;
  }
}

int j = 0;
int euclidOldRecursive(int a, int b) {
  j++;
  if (b == 0) {
    return a;
  } else {
    if (a == 0) {
      return b;
    } else {
      if (a > b) {
        return euclidOldRecursive(a - b, b);
      } else {
        return euclidOldRecursive(a, b - a);
      }
    }
  }
}

bool isEven(int number) {
  var result = number % 2;
  if (result == 0) {
    return true;
  } else {
    return false;
  }
}

int euclid(int a, int b) {
  int i = 0;
  while (b != 0) {
    int h = a % b;
    a = b;
    b = h;
    i++;
    print('Der Wert von a: $a, der Wert von b: $b');
  }
  print("Schleife wurde $i mal aufgereufen");
  return a;
}

void main(List<String> arguments) {
  //print(euclidOld(1056546, 156));
  //print(euclidOldRecursive(1056546, 156));
  print(euclid(1056546, 156));
  //print('Rekursion $j');
  //print(isEven(13));
}
