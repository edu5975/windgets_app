import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:windgets_app/config/menu/menu_items.dart';
import 'package:windgets_app/presentation/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Flutter + Material 3'),
      ),
      body: const _HomeView(),
      drawer: SideMenu(
        scaffoldKey: scaffoldKey,
      ),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final appMenuItem = appMenuItems[index];
        return _CustomListTitle(appMenuItem: appMenuItem);
      },
    );
  }
}

class _CustomListTitle extends StatelessWidget {
  const _CustomListTitle({
    required this.appMenuItem,
  });

  final MenuItem appMenuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(appMenuItem.icon, color: colors.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      title: Text(appMenuItem.title),
      subtitle: Text(appMenuItem.subTitle),
      onTap: () {
        //Navigator.pushNamed(context, appMenuItem.link);
        context.push(appMenuItem.link);
        //context.pushNamed(CardsScreen.name);
      },
    );
  }
}
