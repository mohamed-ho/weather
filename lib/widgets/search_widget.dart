import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key, required this.onSubmitted});
  final Function(String)? onSubmitted;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          onSubmitted: onSubmitted,
          decoration: InputDecoration(
              hintText: 'Enter City Name :',
              suffix: const Icon(
                Icons.search,
                size: 25,
              ),
              label: const Text('Search'),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
              )),
        ),
      ),
    );
  }
}
