import 'package:flutter_bloc/flutter_bloc.dart';

part 'string_state.dart';

class StringCubit extends Cubit<StringState> {
  StringCubit() : super(StringState(myName: 'Arun', isNameCap: false));

  void toCapital() => emit(StringState(myName: "ARUN", isNameCap: true));

  void toSmall() => emit(StringState(myName: "arun", isNameCap: true));
}
