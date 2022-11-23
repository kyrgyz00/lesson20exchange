import 'dart:io';

void main() {
  RUB rub = RUB(price: 0.9);
  USD usd = USD(price: 87);
  KZT tenge = KZT(price: 0.21);
  EUR eur = EUR(price: 110);
  print(
      "Dollar: ${usd.price}\nEuro: ${eur.price}\nRuble: ${rub.price}\nTenge: ${tenge.price}");
  Exchenger exch = Exchenger();
  exch.exchange(rub: rub, eur: eur, tenge: tenge, usd: usd);
  // Switch1 djd = Switch1();
  // djd.switch1(rub: rub, eur: eur, tenge: tenge, usd: usd);
  //  Switch2 der = Switch2();
  // der.switch2(rub: rub, eur: eur, tenge: tenge, usd: usd);
}

abstract class Money {
  double price;
  Money({required this.price});

  double buy(int emount) {
    return emount / price;
  }

  double sell(int emount) {
    return emount * price;
  }
}

class RUB extends Money {
  RUB({required super.price});
}

class USD extends Money {
  USD({required super.price});
}

class KZT extends Money {
  KZT({required super.price});
}

class EUR extends Money {
  EUR({required super.price});
}

class Exchenger {
  exchange({
    required RUB rub,
    required EUR eur,
    required KZT tenge,
    required USD usd,
  }) {
    print("1-Would you like to change to som?");
    print("2-Would u like som to another currency");
    int answer = int.parse(stdin.readLineSync()!);
    if (answer == 1) {
      Switch1 bob = Switch1();
      bob.switch1(rub: rub, eur: eur, tenge: tenge, usd: usd);
    } else if (answer == 2) {
      Switch2 sd = Switch2();
      sd.switch2(rub: rub, eur: eur, tenge: tenge, usd: usd);
    } else {
      print("choose correct one");
      return exchange(rub: rub, eur: eur, tenge: tenge, usd: usd);
    }
  }
}

class Switch1 {
  switch1({
    required RUB rub,
    required EUR eur,
    required KZT tenge,
    required USD usd,
  }) {
    print(
        "Choose currency which you want to change into som\n1) USD\n2) EUR\n3) RUB\n4) KZT");
    int ans = int.parse(stdin.readLineSync()!);
    switch (ans) {
      case 1:
        stdout.write("enter dollar: ");
        int som = int.parse(stdin.readLineSync()!);
        double value = usd.sell(som);
        print("Your changing: $value ");
        break;

      case 2:
        stdout.write("enter euro: ");
        int som = int.parse(stdin.readLineSync()!);
        double value = eur.sell(som);
        print("Your changing: $value");
        break;

      case 3:
        stdout.write("enter rubl: ");
        int som = int.parse(stdin.readLineSync()!);
        double value = rub.sell(som);
        print("Your changing: $value");
        break;

      case 4:
        stdout.write("enter tenge: ");
        int som = int.parse(stdin.readLineSync()!);
        double value = tenge.sell(som);
        print("Your changing: $value");
        break;

      default:
        print("Choose correct one");
        return switch1(rub: rub, eur: eur, tenge: tenge, usd: usd);
    }
  }
}

class Switch2 {
  switch2({
    required RUB rub,
    required EUR eur,
    required KZT tenge,
    required USD usd,
  }) {
    print(
        "Choose currency which you want to change som into\n1) USD\n2) EUR\n3) RUB\n4) KZT");
    int ans = int.parse(stdin.readLineSync()!);
    stdout.write("enter som: ");
    switch (ans) {
      case 1:
        int som = int.parse(stdin.readLineSync()!);
        double value = usd.buy(som);
        print("Your changing: $value");
        break;

      case 2:
        int som = int.parse(stdin.readLineSync()!);
        double value = eur.buy(som);
        print("Your changing: $value");
        break;

      case 3:
        int som = int.parse(stdin.readLineSync()!);
        double value = rub.sell(som);
        print("Your changing: $value");
        break;

      case 4:
        int som = int.parse(stdin.readLineSync()!);
        double value = tenge.sell(som);
        print("Your changing: $value");
        break;

      default:
        print("Choose correct one");
        return switch2(rub: rub, eur: eur, tenge: tenge, usd: usd);
    }
  }
}
