import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:les_mediateurs/domain/models/content/trending.dart';

class HomeTrendingGridViewItem extends ConsumerStatefulWidget {
  final int number;
  final Trending trending;

  const HomeTrendingGridViewItem({
    super.key,
    required this.number,
    required this.trending,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<HomeTrendingGridViewItem> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (e) {},
      onExit: (e) {},
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 120,
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
                    "${widget.number}",
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
                      widget.trending.title,
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
                    Text(
                      ///TODO func to display type
                      widget.trending.contentType.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      '${widget.trending.createdAt.day}-${widget.trending.createdAt.month}-${widget.trending.createdAt.year}',
                      style: const TextStyle(
                        fontSize: 16,
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
