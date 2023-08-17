import 'package:flutter/material.dart';
import 'package:news_app/core/extensions/extension.dart';

import '../../../res/colors/app_colors.dart';
import '../../../shared_widgets/main_text.dart';
import '../data/models/article.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({
    required this.article,
    this.withDescription = false,
    this.onTap,
    super.key,
  });
  final Article article;
  final Function? onTap;
  final bool withDescription;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: () => onTap?.call(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                article.urlToImage ?? '',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 8),
              MainText(
                text: article.title ?? '',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 8),
              MainText(
                text: 'By ${article.author ?? ''}',
                fontSize: 14,
              ),
              const SizedBox(height: 16.0),
              if (withDescription)
                MainText(
                  text: article.description ?? '',
                  color: AppColors.TEXT_GREY,
                ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.bottomRight,
                child: MainText(
                  text: DateTime.tryParse(article.publishedAt ?? '')
                      .formattedDate,
                  color: AppColors.TEXT_GREY,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
