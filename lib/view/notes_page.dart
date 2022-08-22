import 'package:flutter/material.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => showDialog(
          context: context,
          builder: (context) => const NotesDialog(),
        ),
      ),
    );
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
              buildIsi(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildJudul() => TextFormField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Judul Catatan",
        ),
      );

  Widget buildIsi() => TextFormField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Isi Catatan",
        ),
      );
}
