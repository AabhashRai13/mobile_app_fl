part of 'image_cubit.dart';

sealed class ImageState extends Equatable {
  const ImageState();

  @override
  List<Object> get props => [];
}

final class ImageInitial extends ImageState {}

final class Reset extends ImageState {}

class ImageUpdated extends ImageState {
  final File? imageFile;
  const ImageUpdated({this.imageFile});
  @override
  List<Object> get props => [imageFile!];
}
