import 'package:flutter/material.dart';
import 'package:les_mediateurs/domain/models/content_miniaturised.dart';

class ContentMiniaturisedItem extends StatelessWidget {
  final ContentMiniaturised contentMiniaturised;

  const ContentMiniaturisedItem({super.key, required this.contentMiniaturised});

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
                      contentMiniaturised.title,
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
                      contentMiniaturised.resume,
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
                      '${contentMiniaturised.created.day}-${contentMiniaturised.created.month}-${contentMiniaturised.created.year}',
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
                contentMiniaturised.imageUrl,
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
