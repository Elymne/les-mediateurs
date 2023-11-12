import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:les_mediateurs/configurations/constantes.dart';
import 'package:les_mediateurs/features/home/presentation/widgets/trending_item.dart';

class TrendingList extends ConsumerStatefulWidget {
  const TrendingList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<TrendingList> {
  final List<String> data = [
    "CACA",
    "TOILETTE",
    "BITE ENORME",
    "CHIASSE GALACTIQUE",
    "ETRON LUNAIRE",
    "PARTOUZE AVEC VIEUX",
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (size.width < mediumScreenCapWidth && size.width >= smallScreenCapWith) {
      return SizedBox();
    }

    if (size.width < smallScreenCapWith) {
      return SizedBox();
    }

    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: largeScreenDisplayWidth,
            height: 400,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 2,
              ),
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                return TrendingItem();
              },
            ),
          ),
        ],
      ),
    );
  }
}
