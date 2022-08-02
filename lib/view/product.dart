import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  const Product({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => showDialog(
          context: context,
          builder: (context) => const ProductDialog(),
        ),
      ),
    );
  }
}

class ProductDialog extends StatelessWidget {
  const ProductDialog({Key? key}) : super(key: key);

  /*@override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }*/

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 8),
              buildNama(),
              const SizedBox(height: 8),
              buildKode(),
              const SizedBox(height: 8),
              buildHarga(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNama() => TextFormField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Nama Produk",
        ),
      );

  Widget buildKode() => TextFormField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Kode Produk",
        ),
      );

  Widget buildHarga() => TextFormField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Harga Produk",
        ),
      );
}
