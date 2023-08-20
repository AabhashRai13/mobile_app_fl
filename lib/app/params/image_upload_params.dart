import 'dart:io';

class ImageUploadParams {
  final File imageFile;
  final String image;
  const ImageUploadParams({required this.imageFile, required this.image});
}
