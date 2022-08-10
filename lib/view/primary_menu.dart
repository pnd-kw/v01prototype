import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'product_page.dart';

class PrimaryMenu extends StatelessWidget {
  const PrimaryMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.asset("assets/images/image-header.jpg"),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.to(() => const ProductPage());
                    },
                    icon: const FaIcon(FontAwesomeIcons.plus),
                  ),
                  const Text("Produk"),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const FaIcon(FontAwesomeIcons.cashRegister),
                  ),
                  const Text("Transaksi"),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const FaIcon(FontAwesomeIcons.noteSticky),
                  ),
                  const Text("Catatan"),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const FaIcon(FontAwesomeIcons.gear),
                  ),
                  const Text("Pengaturan"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
