import 'package:licence_driving_admin/core/resources/data_state.dart';
import 'package:licence_driving_admin/core/usecases/usecase.dart';
import 'package:licence_driving_admin/features/authentication_management/domain/entities/authentication_request.entity.dart';
import 'package:licence_driving_admin/features/authentication_management/domain/entities/authentication_response.entity.dart';
import 'package:licence_driving_admin/features/authentication_management/domain/entities/error.entity.dart';
import 'package:licence_driving_admin/features/authentication_management/domain/repository/authentication.repository.dart';

class LoginUserUseCase implements UseCase<AuthenticationResponseEntity,AuthenticationRequestEntity,ErrorEntity>{
  final AuthenticationRepository _authenticationRepository;

  const LoginUserUseCase(this._authenticationRepository);
  
  @override
  Future<DataState<AuthenticationResponseEntity,ErrorEntity>> call(AuthenticationRequestEntity p) {
    return _authenticationRepository.loginUser(p);
  }
}
