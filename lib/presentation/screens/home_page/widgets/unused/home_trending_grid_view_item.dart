import 'package:flutter/material.dart';
import 'package:les_mediateurs/domain/models/content/trending.dart';

class HomeTrendingGridViewItem extends StatelessWidget {
  final int number;
  final Trending trending;
  final bool isMobileDisplay;

  const HomeTrendingGridViewItem({
    super.key,
    required this.number,
    required this.trending,
    this.isMobileDisplay = false,
  });

  @override
  Widget build(BuildContext context) {
    final widgetHeight = isMobileDisplay ? 80.0 : 120.0;
    final maxLines = isMobileDisplay ? 1 : 2;
    final titleFontSize = isMobileDisplay ? 16.0 : 20.0;
    final globalFontSize = isMobileDisplay ? 12.0 : 16.0;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (e) {},
      onExit: (e) {},
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: widgetHeight,
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(
                color: Colors.grey,
                width: 0.2,
              ),
              bottom: BorderSide(
                color: Colors.grey,
                width: 0.2,
              ),
            ),
          ),
          child: Row(
            children: [
              const SizedBox(width: 20),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$number",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 30),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      trending.title,
                      maxLines: maxLines,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: titleFontSize,
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        wordSpacing: 0,
                      ),
                    ),
                    Text(
                      trending.contentType.toString(),
                      style: TextStyle(
                        fontSize: globalFontSize,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      '${trending.createdAt.day}-${trending.createdAt.month}-${trending.createdAt.year}',
                      style: TextStyle(
                        fontSize: globalFontSize,
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
