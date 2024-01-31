import 'package:flutter/material.dart';

class FullWidthButton extends StatelessWidget {
  final Function()? onPressed;
  const FullWidthButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(const Size(double.infinity, 40)),
        shape: const MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
      onPressed: onPressed,
      child: const Text('Submit'),
    );
  }
}
