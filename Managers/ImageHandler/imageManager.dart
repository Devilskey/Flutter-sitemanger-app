import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';

Future<String> getImage() async {
  final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (image == null) return "";

  File imageTemp = File(image.path);
  Uint8List imagebytes = await imageTemp.readAsBytes();
  String base64string = base64.encode(imagebytes);

  String finalImageString = "data:image/png;base64,$base64string";
  log(finalImageString);
  return finalImageString;
}
