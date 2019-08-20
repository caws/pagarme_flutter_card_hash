# pagarme_flutter_card_hash

A Flutter package that allows you to generate card hashes to be used with pagar.me's payment platform.

## is this safe?

Well, that's something I wondered too when I was looking for a third party package to use to generate
card hashes when facing the fact that getting the card_hash using pagarme.js library wasn't neat enough
with Flutter.

I began looking into pagarme's C# and PHP libraries and found out that what they do is basically the
process documented [here](https://docs.pagar.me/reference#gerando-card_hash-manualmente).

So this is what this library does and I tried to keep the code as simple as possible so that people
can see that there's no monkey business amidst the lines.

Enjoy

## Getting Started

First, add pagarme_flutter_card_hash as a dependency in your pubspec.yaml file.


```dart
PagarMeFlutterCardHash pagarMeFlutterCardHash = new PagarMeFlutterCardHash(
        pagarmeApiKey: "ek_test_yCRumKDVQgqFkjlQojnTSHgWw7UI5g",
        cardNumber: "5448280000000007",
        cardExpirationDate: "0620}",
        cardCvv: "123",
        cardHolderName: "John Snow");

String cardHash = await pagarMeFlutterCardHash.generateCardHash();
```

TODO:

    Improve exceptions
    Write tests
    Improve documentation

## Author

* **Charles Washington de Aquino dos Santos** - [Caws](https://github.com/caws)