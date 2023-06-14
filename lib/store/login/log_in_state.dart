part of 'log_in_bloc.dart';

@freezed
class LogInState with _$LogInState {
  const factory LogInState.initial() = _Initial;
  const factory LogInState.loading() = _Loading;
  const factory LogInState.success() = _Success;
  const factory LogInState.error(String message) = _Error;

  

  
}
//  _Success get successState => this as _Success;