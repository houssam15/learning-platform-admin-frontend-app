import 'package:licence_driving_admin/core/resources/data_state.dart';
import 'package:licence_driving_admin/core/usecases/usecase.dart';
import 'package:licence_driving_admin/features/authentication_management/domain/repository/authentication.repository.dart';

class LogoutUserUseCase implements UseCase {
  final AuthenticationRepository _authenticationRepository;

  const LogoutUserUseCase(this._authenticationRepository);
  @override
  Future<DataState> call(void params) {
    return _authenticationRepository.logoutUser();
  }
}
