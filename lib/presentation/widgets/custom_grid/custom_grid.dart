import 'package:flutter/material.dart';

class CustomGrid extends StatelessWidget {
  final int itemCount;
  final int itemPerRow;
  final double rowMargin;
  final double margeBetweenItem;
  final Widget Function(int index) builder;

  const CustomGrid({super.key, required this.itemPerRow, required this.itemCount, required this.builder, this.rowMargin = 0, this.margeBetweenItem = 0});

  @override
  Widget build(BuildContext context) {
    final int totalRow = itemCount ~/ itemPerRow;

    final int orphantItem = itemCount % itemPerRow;

    final List<Widget> columnChildren = [];

    for (int i = 0; i < totalRow; i++) {
      final List<Widget> rowItems = [];

      for (int j = 0; j < itemPerRow; j++) {
        rowItems.add(Expanded(child: builder((i * itemPerRow) + j)));

        if (margeBetweenItem > 0 && (j != 0 || j != itemPerRow - 1)) {
          rowItems.add(SizedBox(width: margeBetweenItem));
        }
      }

      columnChildren.add(Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: rowItems,
      ));

      if (rowMargin > 0) {
        columnChildren.add(SizedBox(height: rowMargin));
      }
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: columnChildren,
    );
  }
}
