import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:hw_project/models/currency.dart';
import 'package:hw_project/widgets/list_item.dart';
import 'package:flutter/services.dart';

class CurrencyConversion extends StatefulWidget {
  const CurrencyConversion({Key? key}) : super(key: key);

  @override
  _CurrencyConversionState createState() => _CurrencyConversionState();
}

var currencyMap = {
  0: "try",
  1: "usd",
  2: "eur",
  3: "gbp",
  4: "btc",
  5: "eth",
  6: "jpy",
  7: "aud"
};

class _CurrencyConversionState extends State<CurrencyConversion> {
  int from = 0;
  int to = 1;

  var coefficient = null;
  var enteredNumber = 1.0;

  var items = [
    const DropdownMenuItem(
      value: 0,
      child: Text("TRY", style: TextStyle(color: Colors.white)),
    ),
    const DropdownMenuItem(
      value: 1,
      child: Text("USD", style: TextStyle(color: Colors.white)),
    ),
    const DropdownMenuItem(
      value: 2,
      child: Text("EUR", style: TextStyle(color: Colors.white)),
    ),
    const DropdownMenuItem(
      value: 3,
      child: Text("GBP", style: TextStyle(color: Colors.white)),
    ),
    const DropdownMenuItem(
      value: 4,
      child: Text("BTC", style: TextStyle(color: Colors.white)),
    ),
    const DropdownMenuItem(
      value: 5,
      child: Text("ETH", style: TextStyle(color: Colors.white)),
    ),
    const DropdownMenuItem(
      value: 6,
      child: Text("JPY", style: TextStyle(color: Colors.white)),
    ),
    const DropdownMenuItem(
      value: 7,
      child: Text("AUD", style: TextStyle(color: Colors.white)),
    ),
  ];

  void _onChangeLeft(int? x) {
    setState(() {
      from = x!;
    });
  }

  void _onChangeRight(int? x) {
    setState(() {
      to = x!;
    });
  }

  void _onChangedText(String? x) {
    setState(() {
      try {
        enteredNumber = double.parse(x!);
      } catch (err) {}
    });
  }

  void fetchCurrencies() async {
    var url =
        "https://cdn.jsdelivr.net/gh/fawazahmed0/currency-api@1/latest/currencies/${currencyMap[from]}.min.json";

    try {
      final response = await get(Uri.parse(url));
      final jsonData = Currency.fromJson(
          jsonDecode(response.body), currencyMap[to]!,
          firstCurrency: currencyMap[from]!);

      setState(() {
        coefficient = jsonData.value;
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
    fetchCurrencies();

    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 100.0),
            child: Container(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, bottom: 50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Convert a currency to another!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    TextFormField(
                      onChanged: _onChangedText,
                      keyboardType: TextInputType.number,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 20.0),
                      initialValue: "1",
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DropdownButton(
                            dropdownColor: const Color(0xFF7858A6),
                            iconSize: 30.0,
                            iconEnabledColor: Colors.white,
                            value: from,
                            items: items.where((element) {
                              return element.value != to;
                            }).toList(),
                            onChanged: _onChangeLeft,
                          ),
                          const Icon(Icons.swap_horiz, color: Colors.white),
                          DropdownButton(
                            dropdownColor: const Color(0xFF7858A6),
                            iconSize: 30.0,
                            iconEnabledColor: Colors.white,
                            value: to,
                            items: items.where((element) {
                              return element.value != from;
                            }).toList(),
                            onChanged: _onChangeRight,
                          )
                        ]),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 25.0, horizontal: 50.0),
                      width: 300.0,
                      color: const Color(0xFF7858A6),
                      child: coefficient != null
                          ? Center(
                              child: Text(
                              (coefficient * enteredNumber).toString(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ))
                          : const CircularProgressIndicator(),
                    )
                  ],
                ))));
  }
}
