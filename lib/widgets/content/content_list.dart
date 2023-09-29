import 'package:flutter/material.dart';
import 'package:netflix_clone/models/content_model.dart';

class ContentList extends StatelessWidget {
  const ContentList({
    super.key,
    required this.title,
    required this.contentList,
    this.isOriginal = false,
  });

  final String title;
  final List<Content> contentList;
  final bool isOriginal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: isOriginal ? 500 : 220,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: contentList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    height: isOriginal ? 400 : 200,
                    width: isOriginal ? 200 : 130,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          contentList[index].imageUrl,
                        ),
                        fit: BoxFit.cover
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
