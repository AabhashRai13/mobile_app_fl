import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'qr_event.dart';
part 'qr_state.dart';

class QrBloc extends Bloc<QrEvent, QrState> {
  QrBloc()
      : super(QrInitial());


}
