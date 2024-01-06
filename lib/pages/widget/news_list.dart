import 'package:flutter/material.dart';
import 'package:simple_news_app/pages/widget/news_tile.dart';
import 'package:simple_news_app/services/news_service.dart';

class NewsList extends StatefulWidget {
  const NewsList({super.key});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  late BreakNewsService breakNewsService;
  @override
  void initState() {
    super.initState();
    breakNewsService = BreakNewsService();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: breakNewsService.getBreakingNews(),
      builder: (
        context,
        AsyncSnapshot snapshot,
      ) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: breakNewsService.newsList.length,
            itemBuilder: (context, index) {
              return NewsTile(
                urlToImage:
                    breakNewsService.newsList[index].urlToImage.toString(),
                title: breakNewsService.newsList[index].title.toString(),
                publishedDate: breakNewsService.newsList[index].publishedAt,
                source: breakNewsService.newsList[index].source.name.toString(),
                description:
                    breakNewsService.newsList[index].description.toString(),
              );
            },
          );
        }
      },
    );
  }
}
