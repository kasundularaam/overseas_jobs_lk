import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';

class FilesService {
  static Future<String> getDocs() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      List<int> fileInByte = file.readAsBytesSync();
      String fileInBase64 = base64Encode(fileInByte);
      return fileInBase64;
    } else {
      throw "no file picked";
    }
  }
}
