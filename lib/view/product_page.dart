import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:v01prototype/model/product.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<Box<Product>>(
        valueListenable: Boxes.getProduct().listenable(),
        builder: (context, box, _) {
          final product = box.values.toList().cast<Product>();

          return buildContent(product);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => showDialog(
          context: context,
          builder: (context) => ProductDialog(
            onClickedDone: addProduct,
          ),
        ),
      ),
    );
  }

  Future addProduct(String nama, String kode, double harga) async {
    final product = Product()
      ..nama = nama
      ..kode = kode
      ..harga = harga;

    final box = Boxes.getProduct();
    box.add(product);
  }
}

class Boxes {
  static Box<Product> getProduct() => Hive.box<Product>('product');
}

Widget buildContent(List<Product> product) {
  if (product.isEmpty) {
    return const Center(
      child: Text(
        'Belum ada daftar produk',
        style: TextStyle(fontSize: 32),
      ),
    );
  } else {
    return Column(
      children: [
        const SizedBox(height: 24),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: product.length,
            itemBuilder: (BuildContext context, int index) {
              final produk = product[index];

              return buildProduct(context, produk);
            },
          ),
        )
      ],
    );
  }
}

Widget buildProduct(
  BuildContext context,
  Product product,
) {
  final harga = product.harga.toStringAsFixed(2);
  return Card(
    color: Colors.white,
    child: ExpansionTile(
      tilePadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      title: Text(
        product.nama,
        maxLines: 2,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      subtitle: Text(product.kode),
      trailing: Text(
        harga,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    ),
  );
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
    final isEditing = widget.product != null;

    return AlertDialog(
      content: Form(
        key: formKey,
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
      actions: <Widget>[
        buildCancelButton(context),
        buildAddButton(context, isEditing: isEditing),
      ],
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

  Widget buildCancelButton(BuildContext context) {
    return TextButton(
      child: const Text('Cancel'),
      onPressed: () => Navigator.of(context).pop(),
    );
  }

  Widget buildAddButton(BuildContext context, {required bool isEditing}) {
    final text = isEditing ? 'Save' : 'Add';
    return TextButton(
      child: Text(text),
      onPressed: () async {
        final isValid = formKey.currentState!.validate();

        if (isValid) {
          final nama = namaController.text;
          final kode = kodeController.text;
          final harga = double.tryParse(hargaController.text) ?? 0;

          widget.onClickedDone(nama, kode, harga);

          Navigator.of(context).pop();
        }
      },
    );
  }
}
