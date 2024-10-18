import 'package:flutter/material.dart';

import 'API.dart';
import 'LocationPage.dart';
import 'http_handler.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ApiTest(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  HttpHandler httpHandler = new HttpHandler();
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container();
  }
}




//  DropdownSearch<String>(
//           popupProps: PopupProps.menu(
//             showSelectedItems: true,
//             disabledItemFn: (String s) => s.startsWith('I'),
//           ),
//           items: const ['Brazil', 'Italia (Disabled)', 'Tunisia', 'Canada'],
//           dropdownDecoratorProps: const DropDownDecoratorProps(
//             dropdownSearchDecoration: InputDecoration(
//               labelText: 'Menu mode',
//               hintText: 'country in menu mode',
//             ),
//           ),
//           onChanged: print,
//           selectedItem: 'Brazil',
//         ),
//         DropdownSearch<String>.multiSelection(
//           items: const ['Brazil', 'Italia (Disabled)', 'Tunisia', 'Canada'],
//           popupProps: PopupPropsMultiSelection.menu(
//             showSearchBox: true,
//             showSelectedItems: true,
//             disabledItemFn: (String s) => s.startsWith('T'),
//           ),
//           onChanged: print,
//           selectedItems: const ['Brazil'],
//         ),
