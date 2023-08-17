import 'package:flutter/material.dart';

import '../../res/colors/app_colors.dart';
import '../../shared_widgets/app_bar.dart';
import '../../shared_widgets/main_text.dart';
import '../articles/presentation/pages/articles_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.BACKGROUND_COLOR,
        appBar: _buildAppBar(),
        body: const ArticlesPage(),
        drawer: _buildDrawer(),
      ),
    );
  }

  PreferredSize _buildAppBar() {
    return PreferredSize(
      preferredSize: CustomAppBar.preferredSize,
      child: CustomAppBar(
        title: 'New Articles',
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  _buildDrawer() {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 64.0,
          horizontal: 16.0,
        ),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage('lib/res/images/profile.png'),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    MainText(
                      text: 'Welcome',
                      color: AppColors.TEXT_GREY,
                      fontSize: 14.0,
                    ),
                    MainText(
                      text: 'Tony Roshdy',
                      fontSize: 20.0,
                    ),
                  ],
                ),
                const Spacer(),
                Image.asset(
                  'lib/res/images/arrow.png',
                  height: 36.0,
                  width: 36.0,
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: drawerItems.length,
                itemBuilder: (context, index) {
                  final item = drawerItems.entries.elementAt(index);
                  return _buildDrawerItem(
                    iconPath: item.value,
                    title: item.key,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                            content: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: MainText(text: item.key),
                        )),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildDrawerItem({
    required String iconPath,
    required String title,
    required Function() onTap,
  }) {
    return ListTile(
      leading: Image.asset(
        iconPath,
        height: 24.0,
        width: 24.0,
      ),
      title: MainText(text: title, fontSize: 18.0),
      onTap: onTap,
    );
  }
}

Map<String, String> drawerItems = {
  'Explore': 'lib/res/images/explore.png',
  'Live Chat': 'lib/res/images/live.png',
  'Gallery': 'lib/res/images/gallery.png',
  'Wish List': 'lib/res/images/wishlist.png',
  'E-Magazine': 'lib/res/images/e-magazine.png',
};
