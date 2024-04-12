import 'package:flutter/material.dart';

class SearchInputField extends StatefulWidget {
  const SearchInputField({
    super.key,
    required this.controller,
    required this.onChangedHandler,
    this.fillColor,
  });

  final TextEditingController controller;
  final Function onChangedHandler;
  final Color? fillColor;

  @override
  _SearchInputFieldState createState() => _SearchInputFieldState();
}

class _SearchInputFieldState extends State<SearchInputField> {
  late TextEditingController _controller;
  @override
  void initState() {
    _controller = widget.controller;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 260,
        height: 40,
        decoration: ShapeDecoration(
          color: widget.fillColor ?? Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: TextField(
          onChanged: (String value) {
            widget.onChangedHandler(value);
          },
          controller: _controller,
          decoration: InputDecoration(
            hintText: 'Search Hospitas ',
            hintStyle: const TextStyle(
              color: Colors.amber,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.50,
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.amber,
              ),
            ),
          ),
          onSubmitted: (String value) {},
        ),
      ),
    );
  }
}
