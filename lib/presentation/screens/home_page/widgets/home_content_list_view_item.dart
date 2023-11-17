import 'package:flutter/material.dart';
import 'package:les_mediateurs/domain/models/content/reduced_content.dart';

class HomeContentListViewItem extends StatelessWidget {
  final bool isMobileDisplay;
  final ReducedContent reducedContent;

  const HomeContentListViewItem({super.key, required this.reducedContent, this.isMobileDisplay = false});

  @override
  Widget build(BuildContext context) {
    final widgetHeight = isMobileDisplay ? 100.0 : 160.0;
    final maxLines = isMobileDisplay ? 2 : 3;
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
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      reducedContent.title,
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: titleFontSize,
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        wordSpacing: 0,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      reducedContent.description,
                      maxLines: maxLines,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        fontSize: globalFontSize,
                        color: Colors.grey,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    const SizedBox(height: 10),
                    Text(
                      '${reducedContent.createdAt.day}-${reducedContent.createdAt.month}-${reducedContent.createdAt.year}',
                      style: TextStyle(
                        fontSize: globalFontSize,
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 40),
              Image.network(
                reducedContent.thumbnailUrl,
                height: widgetHeight,
                width: widgetHeight,
                fit: BoxFit.cover,
              )
            ],
          ),
        ),
      ),
    );
  }
}
