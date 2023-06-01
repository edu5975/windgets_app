import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackbar = SnackBar(
      content: const Text('Hola mundo'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('¿Estás seguro?'),
        content: const Text(
            'Veniam aliqua sint id anim eiusmod commodo qui nulla ea sunt nisi ullamco do. Anim dolor velit voluptate elit proident proident magna ullamco officia occaecat. Ad consectetur reprehenderit laborum irure incididunt officia veniam elit. Proident laboris mollit ullamco incididunt et. Minim sunt exercitation tempor laborum ullamco sint minim incididunt quis consequat cillum consectetur labore. Laboris qui sunt cupidatat nulla nostrud culpa enim deserunt consequat nulla occaecat. Aute ut eu consectetur est duis nulla excepteur consectetur ullamco.'),
        actions: [
          TextButton(
              onPressed: () => context.pop(), child: const Text('Cancelar')),
          TextButton(
              onPressed: () => context.pop(), child: const Text('Aceptar')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Díalogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(context: context, children: [
                  const Text(
                      'Non excepteur dolor ipsum excepteur et fugiat velit in incididunt qui ex consequat consequat non.')
                ]);
              },
              child: const Text('Licencias Usadas'),
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text('Mostrar Dialogo'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackBar(context),
        label: const Text("Mostrar Snackbar"),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}
