import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:hw_project/models/currency.dart';
import 'package:hw_project/widgets/list_item.dart';

class HighlightedCurrencies extends StatefulWidget {
  const HighlightedCurrencies({Key? key}) : super(key: key);

  @override
  _HighlightedCurrenciesState createState() => _HighlightedCurrenciesState();
}

class _HighlightedCurrenciesState extends State<HighlightedCurrencies> {
  final url =
      "https://cdn.jsdelivr.net/gh/fawazahmed0/currency-api@1/latest/currencies/try.min.json";

  var _currenciesJson = Map<String, double>();

  void fetchCurrencies() async {
    try {
      final response = await get(Uri.parse(url));
      final jsonDataUsd = Currency.fromJson(jsonDecode(response.body), "usd");
      final jsonDataEur = Currency.fromJson(jsonDecode(response.body), "eur");
      final jsonDataGbp = Currency.fromJson(jsonDecode(response.body), "gbp");
      final jsonDataBtc = Currency.fromJson(jsonDecode(response.body), "btc");
      final jsonDataEth = Currency.fromJson(jsonDecode(response.body), "eth");
      final jsonDataJpy = Currency.fromJson(jsonDecode(response.body), "jpy");
      final jsonDataAud = Currency.fromJson(jsonDecode(response.body), "aud");

      setState(() {
        _currenciesJson = {
          "usd": jsonDataUsd.value,
          "eur": jsonDataEur.value,
          "gbp": jsonDataGbp.value,
          "btc": jsonDataBtc.value,
          "eth": jsonDataEth.value,
          "jpy": jsonDataJpy.value,
          "aud": jsonDataAud.value
        };
      });
    } catch (err) {}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchCurrencies();
  }

  @override
  Widget build(BuildContext context) {
    var items = [
      ListItem("1₺", "${(_currenciesJson["usd"])}\$", key: const Key("1")),
      ListItem("1₺", "${(_currenciesJson["eur"])}€", key: const Key("2")),
      ListItem("1₺", "${(_currenciesJson["gbp"])}£", key: const Key("3")),
      ListItem("1₺", "${(_currenciesJson["btc"])}₿", key: const Key("4")),
      ListItem("1₺", "${(_currenciesJson["eth"])}Ξ", key: const Key("5")),
      ListItem("1₺", "${(_currenciesJson["jpy"])}¥", key: const Key("6")),
      ListItem("1₺", "${(_currenciesJson["aud"])}AU\$", key: const Key("7")),
    ];

    return Scaffold(
      body: _currenciesJson.isNotEmpty
          ? ListView(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              children: items,
            )
          : const Center(child: CircularProgressIndicator()),
      backgroundColor: Colors.transparent,
    );
  }
}
