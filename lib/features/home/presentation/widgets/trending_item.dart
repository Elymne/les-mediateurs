import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TrendingItem extends ConsumerStatefulWidget {
  const TrendingItem({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<TrendingItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: const Border(
              bottom: BorderSide(
                width: 2,
                color: Colors.black,
              ),
            ),
          ),
          child: Row(
            children: [
              Text("N°1"),
              SizedBox(width: 30),
              Column(
                children: [
                  Text("Ceci est la catégorie du bidule article mon cul"),
                  Text("Ceci est un titre de film de cul très connu"),
                  Text("Ceci est la date de parution du bidule"),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
