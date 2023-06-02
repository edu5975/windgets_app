import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
      'Busca la comida',
      'Excepteur est reprehenderit magna ad. Non nulla mollit ad ad minim dolor elit cupidatat deserunt proident velit non. Ea aliqua ex commodo magna reprehenderit tempor culpa in.',
      'assets/images/1.png'),
  SlideInfo(
      'Entrega rápida',
      'Deserunt fugiat mollit pariatur tempor commodo amet non velit nostrud magna irure culpa. Labore velit qui excepteur consequat sunt voluptate sint laborum aliqua incididunt voluptate pariatur reprehenderit sunt. Laborum labore tempor et tempor ex veniam adipisicing ipsum Lorem. Sunt Lorem ex veniam nisi pariatur do ipsum Lorem velit commodo in excepteur veniam. Veniam non sit ad sit reprehenderit aliquip aliqua ea nulla deserunt sint.',
      'assets/images/1.png'),
  SlideInfo(
      'Disfruta la comida',
      'Fugiat consectetur mollit labore commodo laboris voluptate sunt excepteur tempor voluptate consectetur non. Proident nisi in adipisicing et eiusmod. Lorem eiusmod anim do adipisicing sunt qui ad. Enim ea excepteur et labore sint aute ut exercitation exercitation non. Elit proident nulla ipsum labore sunt anim sunt mollit elit. Aliqua non cupidatat ut eiusmod cupidatat culpa ea nostrud magna pariatur exercitation pariatur.',
      'assets/images/1.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'app_tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map(
                  (slideData) => _Slide(
                    title: slideData.title,
                    caption: slideData.caption,
                    imageUrl: slideData.imageUrl,
                  ),
                )
                .toList(),
          ),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              onPressed: () => context.pop(),
              child: const Text('Salir'),
            ),
          ),
          endReached
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(milliseconds: 600),
                    child: FilledButton(
                      child: const Text('Comenzar'),
                      onPressed: () => context.pop(),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(image: AssetImage(imageUrl)),
          const SizedBox(height: 10),
          Text(title, style: titleStyle),
          const SizedBox(height: 10),
          Text(caption, style: captionStyle),
        ],
      ),
    );
  }
}
