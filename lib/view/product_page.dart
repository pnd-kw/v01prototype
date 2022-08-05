import 'package:flutter/material.dart';
import 'package:v01prototype/model/product.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => showDialog(
          context: context,
          builder: (context) => ProductDialog(),
        ),
      ),
    );
  }
}

class ProductDialog extends StatefulWidget {
  final Product? product;
  final Function(String nama, String kode, double harga) onClickedDone;

  const ProductDialog({
    Key? key,
    this.product,
    required this.onClickedDone,
  }) : super(key: key);

  @override
  State<ProductDialog> createState() => _ProductDialogState();
}

class _ProductDialogState extends State<ProductDialog> {
  final formKey = GlobalKey<FormState>();
  final namaController = TextEditingController();
  final kodeController = TextEditingController();
  final hargaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.product != null) {
      final product = widget.product!;

      namaController.text = product.nama;
      kodeController.text = product.kode;
      hargaController.text = product.harga.toString();
    }
  }

  @override
  void dispose() {
    namaController.dispose();
    kodeController.dispose();
    hargaController.dispose();

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
        controller: namaController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Nama Produk",
        ),
        validator: (nama) =>
            nama != null && nama.isEmpty ? 'Masukkan Nama' : null,
      );

  Widget buildKode() => TextFormField(
        controller: kodeController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Kode Produk",
        ),
        validator: (kode) =>
            kode != null && kode.isEmpty ? 'Masukkan kode' : null,
      );

  Widget buildHarga() => TextFormField(
        controller: hargaController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Harga Produk",
        ),
        keyboardType: TextInputType.number,
        validator: (harga) => harga != null && double.tryParse(harga) == null
            ? 'Masukkan angka yang benar'
            : null,
      );
}
