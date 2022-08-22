import 'package:hive/hive.dart';

part 'notes.g.dart';

@HiveType(typeId : 1)
class Notes extends HiveObject {
  @HiveField(0)
  late String judul;

  @HiveField(1)
  late String isi;
}