import 'dart:developer';
import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source) async{
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _files = await _imagePicker.pickImage(source: source);
  if(_files != null){
    return await _files.readAsBytes();
  }
  else {
    log("No any image picked");
  }
}