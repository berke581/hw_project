import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListItem extends StatefulWidget {
  late String valueLeft = "";
  late String valueRight = "";

  ListItem(this.valueLeft, this.valueRight, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ListItemState(valueLeft, valueRight);
  }
}

class _ListItemState extends State<ListItem> {
  late String valueLeft = "";
  late String valueRight = "";

  _ListItemState(this.valueLeft, this.valueRight, {Key? key});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                border: Border.all(color: const Color(0xFF4C3575), width: 1.0),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFF371B58),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, 2), // changes position of shadow
                  )
                ],
                color: const Color(0xFF7858A6)),
            child: ListTile(
              // leading: Text(
              //     NumberFormat.simpleCurrency(
              //             locale: Localizations.localeOf(context).toString())
              //         .currencySymbol,
              //     textScaleFactor: 1.5),
              title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(valueLeft, textScaleFactor: 1.5)
                        // Text(
                        //     NumberFormat.simpleCurrency(
                        //             locale: Localizations.localeOf(context)
                        //                 .toString())
                        //         .currencySymbol,
                        //     textScaleFactor: 1.5)
                      ],
                    ),
                    const Icon(Icons.swap_horiz),
                    Row(
                      children: [
                        Text(valueRight, textScaleFactor: 1.5)
                        // Text(
                        //     NumberFormat.simpleCurrency(
                        //             locale: Localizations.localeOf(context)
                        //                 .toString())
                        //         .currencySymbol,
                        //     textScaleFactor: 1.5)
                      ],
                    )
                  ]),
              // trailing: const IconButton(
              //   icon: Icon(Icons.star),
              //   onPressed: _onSearchButtonPressed,
              // ),
              textColor: Colors.white,
              iconColor: Colors.white,
            )));
  }
}

// void _onSearchButtonPressed() {
//   print("search button clicked");
// }
