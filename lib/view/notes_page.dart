import 'package:flutter/material.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }

}

class NotesDialog extends StatefulWidget {
  const NotesDialog({Key? key}) : super(key: key);

  @override
  State<NotesDialog> createState() => _NotesDialogState();
}

class _NotesDialogState extends State<NotesDialog> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 8),
              buildJudul(),
              const SizedBox(height: 8),
              buildTanggal(),
              const SizedBox(height: 8),
              buildIsi(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildJudul() => TextFormField();
  Widget buildTanggal() => TextFormField();
  Widget buildIsi() => TextFormField();
}