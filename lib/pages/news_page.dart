import 'package:flutter/material.dart';
import 'package:simple_news_app/pages/widget/news_list.dart';
// import 'package:simple_news_app/pages/widget/news_tile.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Breaking News from india'),
        ),
        body: const NewsList()
        // Column(

        );
  }
}
