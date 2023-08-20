import 'dart:io';
import 'dart:developer';
import 'package:find_scan_return_app/app/di.dart';
import 'package:find_scan_return_app/presentation/userDetails/cubit/image_cubit.dart';
import 'package:image_picker/image_picker.dart';

class ImageSelector {
  final ImagePicker _picker = ImagePicker();
  final ImageCubit imageCubit = sl<ImageCubit>();
  File? imageFile;
  String? imageName;
  Future<File> getImage() async {
// Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//TO convert Xfile into file
    imageFile = File(image!.path);
//print(‘Image picked’);
    imageName = ("${imageFile!.path}Image");
    imageCubit.setImage(imageFile!);
    log("image name $imageName");
    return imageFile!;
  }
}
