import 'package:flutter/material.dart';
import 'package:les_mediateurs/domain/models/content/reduced_content.dart';

class HomeContentListViewItem extends StatelessWidget {
  final ReducedContent reducedContent;

  const HomeContentListViewItem({super.key, required this.reducedContent});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (e) {},
      onExit: (e) {},
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 160,
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
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        wordSpacing: 0,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      reducedContent.description,
                      maxLines: 3,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    const SizedBox(height: 10),
                    Text(
                      '${reducedContent.createdAt.day}-${reducedContent.createdAt.month}-${reducedContent.createdAt.year}',
                      style: const TextStyle(
                        fontSize: 16,
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
                height: 160,
                width: 160,
                fit: BoxFit.cover,
              )
            ],
          ),
        ),
      ),
    );
  }
}
