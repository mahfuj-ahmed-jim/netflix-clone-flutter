import 'package:flutter/material.dart';
import 'package:netflix_clone/data/data.dart';
import 'package:netflix_clone/widgets/appbar/custom_app_bar.dart';

import '../../widgets/header/content_header.dart';
import '../../widgets/previews/previews.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController scrollController;
  double scrollOffset = 0.0;

  @override
  void initState() {
    scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          scrollOffset = scrollController.offset;
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 50),
        child: CustomAppBar(scrollOffset: scrollOffset),
      ),
      body: CustomScrollView(
        controller: scrollController,
        slivers: const [
          SliverToBoxAdapter(
            child: ContentHeader(featuredContent: sintelContent),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 20),
            sliver: SliverToBoxAdapter(
              child: Previews(
                title: 'Previews',
                contentList: previews,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[850],
        child: const Icon(Icons.cast),
        onPressed: () => print('cast'),
      ),
    );
  }
}
