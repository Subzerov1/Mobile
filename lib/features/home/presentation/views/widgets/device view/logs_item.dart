import 'package:flutter/material.dart';
import 'package:subzero_mobile/core/utils/extension.dart';
import 'package:subzero_mobile/features/home/data/models/log_model.dart';

class LogsItem extends StatelessWidget {
  final LogModel log;
  const LogsItem(this.log, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 16),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          right: BorderSide(color: log.statusColor, width: 7),
        ),
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                log.date?.formate(context.lang) ?? "",
                style: context.texts.titleMedium,
              ),
              Text(
                log.date?.time(context.lang) ?? "",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Text(
            "${log.percentage}%",
            style: context.texts.titleMedium,
          ),
        ],
      ),
    );
  }
}
