import 'package:licence_driving_admin/core/usecases/usecase.dart';

import '../../../../core/resources/data_state.dart';
import '../entities/error.entity.dart';
import '../entities/user.entity.dart';
import '../repository/authentication.repository.dart';

class GetConnectedUserUseCase implements UseCase<UserEntity,int?,ErrorEntity>{
  final AuthenticationRepository _authenticationRepository;
  const GetConnectedUserUseCase(this._authenticationRepository);

  @override
  Future<DataState<UserEntity, ErrorEntity>> call(int? key) {
    return _authenticationRepository.getUserByKey(key);
  }

}