import 'package:hive/hive.dart';

part 'product.g.dart';

@HiveType(typeId : 0)
class Product extends HiveObject {
  @HiveField(0)
  late String nama;

  @HiveField(1)
  late String kode;

  @HiveField(2)
  late double harga;
}