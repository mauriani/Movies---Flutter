import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../core/constant.dart';

class ChipDate extends StatelessWidget {
  final DateTime date;
  final Color color;
  final String dateFormat;

  const ChipDate(
      {super.key,
      required this.date,
      this.color = Colors.red,
      this.dateFormat = kDateFormat});

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: color.withOpacity(0.3),
      padding: const EdgeInsets.symmetric(horizontal: 18),
      avatar: const CircleAvatar(
        backgroundColor: Colors.transparent,
        child: Icon(Icons.calendar_today, size: 18, color: Colors.white),
      ),
      label: Text(DateFormat(dateFormat).format(date),
          textAlign: TextAlign.end,
          style: const TextStyle(fontSize: 18, color: Colors.white)),
    );
  }
}
