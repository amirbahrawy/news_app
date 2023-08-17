import 'package:flutter/material.dart';
import 'package:news_app/features/articles/presentation/pages/web_view_page.dart';
import 'package:news_app/res/colors/app_colors.dart';
import 'package:news_app/shared_widgets/show_snack_bar.dart';

import '../../../../shared_widgets/app_bar.dart';
import '../../../../shared_widgets/main_text.dart';
import '../../data/models/article.dart';
import '../../widgets/article_item.dart';

class ArticleDetails extends StatelessWidget {
  const ArticleDetails(this.article, {super.key});
  final Article article;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: CustomAppBar.preferredSize,
          child: const CustomAppBar(title: 'Article Details'),
        ),
        body: Column(
          children: [
            ArticleItem(
              article: article,
              withDescription: true,
            ),
            const SizedBox(height: 16),
            _buildOpenWebsiteButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildOpenWebsiteButton(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
        onPressed: () {
          if (article.url != null)
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => WebViewPage(article.url!),
              ),
            );
          else
            showSnackBar(context, message: 'No URL Found');
        },
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: MainText(
            text: 'OPEN WEBSITE',
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
