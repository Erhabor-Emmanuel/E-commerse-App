import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                hintText: "Search for Products",
                hintStyle: const TextStyle(
                  color: Colors.grey,
                ),
                prefixIcon: Container(
                  padding: const EdgeInsets.all(15),
                  width: 15,
                  child: Image.asset('assets/icons/filter.png'),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black,
            ),
            child: Image.asset(
              'assets/icons./filter.png',
              width: 15,
            ),
          ),
        ],
      ),
    );
  }
}
