import 'package:licence_driving_admin/core/resources/data_state.dart';
import 'package:licence_driving_admin/core/usecases/usecase.dart';
import 'package:licence_driving_admin/features/authentication_management/domain/entities/error.entity.dart';
import 'package:licence_driving_admin/features/authentication_management/domain/entities/user.entity.dart';
import 'package:licence_driving_admin/features/authentication_management/domain/repository/authentication.repository.dart';

class GetCurrentUserUseCase implements UseCase<UserEntity,void,ErrorEntity> {
  final AuthenticationRepository _authenticationRepository;

  const GetCurrentUserUseCase(this._authenticationRepository);
  @override
  Future<DataState<UserEntity, ErrorEntity>> call(void params) {
    return _authenticationRepository.getCurrentUser();
  }
}
