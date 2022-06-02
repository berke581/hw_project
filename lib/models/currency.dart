class Currency {
  final String currency;
  final double value;

  const Currency({
    required this.currency,
    required this.value,
  });

  factory Currency.fromJson(Map<String, dynamic> json, String baseCurrency,
      {firstCurrency = "try"}) {
    return Currency(
      currency: "usd",
      value: json[firstCurrency][baseCurrency],
    );
  }
}
