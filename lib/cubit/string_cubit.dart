import 'package:flutter_bloc/flutter_bloc.dart';

part 'string_state.dart';

class StringCubit extends Cubit<StringState> {
  StringCubit() : super(StringState(myName: 'Arun', isNameCap: false));

  void toCapital() => emit(StringState(myName: state.myName='Tarun', isNameCap: true));

  void toSmall() => emit(StringState(myName:  state.myName='Yash', isNameCap: true));
}
