import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          // Remove focus and dismiss keyboard
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            currentFocus.focusedChild?.unfocus();
          }
        },
        child: TextField(
          style: TextStyle(fontSize: 20),
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: 1.5,
            ),
            prefixIcon: IconButton(
              padding: const EdgeInsets.only(top: 1.0, bottom: 1.0, left: 4.0),
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
            hintText: "Search here...",
          ),
        ),
      ),
    );
  }
}
