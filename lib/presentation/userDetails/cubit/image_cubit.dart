import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit() : super(ImageInitial());

  setImage(File file) {
    emit(ImageUpdated(imageFile: file));
  }

  resetImage() {
    emit(ImageInitial());
  }
}
