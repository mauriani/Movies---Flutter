import 'package:flutter/material.dart';

class Rate extends StatelessWidget {
  final double? value;
  const Rate({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Icon(Icons.favorite, color: Colors.red),
      const SizedBox(width: 8),
      Text(value?.toStringAsFixed(1) ?? '0.0',
          style: const TextStyle(fontSize: 18)),
    ]);
  }
}
