import 'package:flutter/material.dart';
import 'package:hw_project/screens/currency_conversion.dart';
import 'package:hw_project/screens/highlighted_currencies.dart';
import 'package:hw_project/widgets/change_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF4C3575), Color(0xFF5B4B8A)])),
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Currency Conversion'),
                bottom: const TabBar(
                  tabs: [
                    Tab(
                      text: "Home",
                      icon: Icon(Icons.home),
                    ),
                    Tab(
                      text: "Convert",
                      icon: Icon(Icons.currency_exchange),
                    )
                  ],
                ),
                actions: [ChangeThemeButtonWidget()],
                // backgroundColor: const Color(0xFF371B58)
              ),
              body: const TabBarView(children: [
                Center(
                  child: HighlightedCurrencies(),
                ),
                Center(child: CurrencyConversion()),
              ]),
              backgroundColor: Colors.transparent,
            )));
  }
}
